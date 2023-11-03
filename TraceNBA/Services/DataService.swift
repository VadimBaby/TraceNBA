//
//  DataService.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import Combine

enum TypeEntity {
    case team
    case player
    case manager
    
    func getUrlString(id: Int) -> String {
        switch self {
        case .team:
            return "https://basketapi1.p.rapidapi.com/api/basketball/team/\(id)/image"
        case .player:
            return "https://basketapi1.p.rapidapi.com/api/basketball/player/\(id)/image"
        case .manager:
            return "https://basketapi1.p.rapidapi.com/api/basketball/manager/\(id)/image"
        }
    }
}

actor DataService: DataServiceProtocol {
    func getLiveMatchesData() async throws -> Data {
        
        guard let url = URL(string: "https://basketapi1.p.rapidapi.com/api/basketball/matches/live") else { throw URLError(.badURL) }
        
        guard let apiKey = Constants.rapidKeys.randomElement() else { throw Errors.apiKeySetIsEmpty }
        
        let headers = [
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": "basketapi1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        do {
            let (response, _) = try await URLSession.shared.data(for: request)
            
            return response
        } catch {
            throw error
        }
    }
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> Data {
        let urlString = entity.getUrlString(id: id)
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        guard let apiKey = Constants.rapidKeys.randomElement() else { throw Errors.apiKeySetIsEmpty }
        
        let headers = [
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": "basketapi1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (response, _) = try await URLSession.shared.data(for: request)
        
        return response
    }
}
