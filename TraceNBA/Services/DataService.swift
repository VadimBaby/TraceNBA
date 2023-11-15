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
    
    let seconds: Double = 2.5
    
    func getLiveMatchesData(isRefresh: Bool) async throws -> Data {
        
        guard let url = URL(string: "https://basketapi1.p.rapidapi.com/api/basketball/matches/live") else { throw URLError(.badURL) }
        
        return try await getDataFromUrl(url: url, isRefresh: isRefresh)
    }
    
    func getScheduleMatchesData(dateSchedule: Date, isRefresh: Bool) async throws -> Data {
        
        let day = try getIntOfTypeTimeFromDate(date: dateSchedule, typeTime: .day)
        let month = try getIntOfTypeTimeFromDate(date: dateSchedule, typeTime: .month)
        let year = try getIntOfTypeTimeFromDate(date: dateSchedule, typeTime: .year)
        
        let urlString: String = "https://basketapi1.p.rapidapi.com/api/basketball/category/\(Constants.category)/events/\(day)/\(month)/\(year)"
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        return try await getDataFromUrl(url: url, isRefresh: isRefresh)
    }
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> UIImage {
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
    
    func getStatisticsMatchData(id: Int, isRefresh: Bool) async throws -> Data {
        let urlString = "https://basketapi1.p.rapidapi.com/api/basketball/match/\(id)/statistics"
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        return try await getDataFromUrl(url: url, isRefresh: isRefresh)
    }
    
    func getMatchLineups(id: Int, isRefresh: Bool) async throws -> Data {
        let urlString = "https://basketapi1.p.rapidapi.com/api/basketball/match/\(id)/lineups"
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        return try await getDataFromUrl(url: url, isRefresh: isRefresh)
    }
    
    func getMatchHighlights(id: Int, isRefresh: Bool) async throws -> Data {
        let urlString = "https://basketapi1.p.rapidapi.com/api/basketball/match/\(id)/highlights"
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        return try await getDataFromUrl(url: url, isRefresh: isRefresh)
    }
    
    func getMatchIncidents(id: Int, isRefresh: Bool) async throws -> Data {
        let urlString = "https://basketapi1.p.rapidapi.com/api/basketball/match/\(id)/incidents"
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        return try await getDataFromUrl(url: url, isRefresh: isRefresh)
    }
    
    func getImageFromUrl(urlString: String) async throws -> Data {
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (response, _) = try await URLSession.shared.data(from: url)
        
        return response
    }
    
    private func getDataFromUrl(url: URL, isRefresh: Bool = false) async throws -> Data {
        guard let apiKey = Constants.rapidKeys.randomElement() else { throw Errors.apiKeySetIsEmpty }
        
        let headers = [
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": "basketapi1.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let nowInterval: Double = Date().timeIntervalSince1970
        
        let differenceBetweenInterval: Double = nowInterval - lastRequestInterval
        
        if differenceBetweenInterval >= seconds {
            lastRequestInterval = nowInterval + seconds
        } else if differenceBetweenInterval < 0 {
            guard !isRefresh else { throw Errors.cannotRefresh }
            
            lastRequestInterval = lastRequestInterval + seconds
            
            try await Task.sleep(for: .seconds(abs(differenceBetweenInterval) + seconds))
            
        } else {
            lastRequestInterval = nowInterval + seconds
            
            try await Task.sleep(for: .seconds(seconds))
        }
        
        let (response, _) = try await URLSession.shared.data(for: request)
        
        return response
    }
    
    private func getIntOfTypeTimeFromDate(date: Date, typeTime: TypeTime) throws -> Int {
        
        var formatter: DateFormatter
        
        if typeTime == .day {
            var dayFormatter: DateFormatter {
                let formatter = DateFormatter()
                formatter.dateFormat = "d"
                
                return formatter
            }
            
            formatter = dayFormatter
        } else if typeTime == .month {
            var monthFormatter: DateFormatter {
                let formatter = DateFormatter()
                formatter.dateFormat = "M"
                
                return formatter
            }
            
            formatter = monthFormatter
        } else {
            var yearFormatter: DateFormatter {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy"
                
                return formatter
            }
            
            formatter = yearFormatter
        }
        
        let typeTime = formatter.string(from: date)
        
        guard let intTypeTime: Int = Int(typeTime) else { throw Errors.badDate }
        
        return intTypeTime
    }
}
