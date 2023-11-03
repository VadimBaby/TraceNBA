//
//  DataService.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import Combine
import SwiftUI

actor DataService: DataServiceProtocol {
    
    var lastRequestInterval: Double = Date().timeIntervalSince1970
    
    func getLiveMatchesData() async throws -> Data {
        
        guard let url = URL(string: "https://basketapi1.p.rapidapi.com/api/basketball/matches/live") else { throw URLError(.badURL) }
        
        guard let apiKey = Constants.rapidKeys.first else { throw Errors.apiKeySetIsEmpty }
        
        let headers = [
            "X-RapidAPI-Key": "f2996c39d6mshd0038ef0b5c5bfcp11fafdjsn1ce8657d5ec9",
            "X-RapidAPI-Host": "basketapi1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (response, _) = try await URLSession.shared.data(for: request)

        print(String(data: response, encoding: .utf8))
        
        return response
    }
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> UIImage {
        let urlString = entity.getUrlString(id: id)
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        guard let apiKey = Constants.rapidKeys.first else { throw Errors.apiKeySetIsEmpty }
        
        let headers = [
            "X-RapidAPI-Key": "f2996c39d6mshd0038ef0b5c5bfcp11fafdjsn1ce8657d5ec9",
            "X-RapidAPI-Host": "basketapi1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let seconds: Double = 2.5
        
        let nowInterval: Double = Date().timeIntervalSince1970
        
        let differenceBetweenInterval: Double = nowInterval - lastRequestInterval
        
        print(differenceBetweenInterval)
        
        let imageFromManager = LocalFileManager.instance.getImage(name: "\(id)", typeFolder: .teams)
        
        guard imageFromManager == nil else {
            guard let imageFromManager else { throw URLError(.badServerResponse) }
            return imageFromManager
        }
        
        if differenceBetweenInterval >= seconds {
            lastRequestInterval = nowInterval + seconds
        } else if differenceBetweenInterval < 0 {
            lastRequestInterval = lastRequestInterval + seconds
            
            try await Task.sleep(for: .seconds(abs(differenceBetweenInterval) + seconds))
            
            let imageFromFileManager = LocalFileManager.instance.getImage(name: "\(id)", typeFolder: .teams)
            
            if let imageFromFileManager {
                return imageFromFileManager
            }
            
        } else {
            lastRequestInterval = nowInterval + seconds
            
            try await Task.sleep(for: .seconds(seconds))
            
            let imageFromFileManager = LocalFileManager.instance.getImage(name: "\(id)", typeFolder: .teams)
            
            if let imageFromFileManager {
                return imageFromFileManager
            }
        }
        
        let (response, _) = try await URLSession.shared.data(for: request)
        
        guard let uiImage = UIImage(data: response) else { throw URLError(.badServerResponse) }
        
        LocalFileManager.instance.saveImage(image: uiImage, name: "\(id)", typeFolder: .teams)
        
        return uiImage

    }
}
