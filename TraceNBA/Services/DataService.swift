//
//  DataService.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import Combine

actor DataService: DataServiceProtocol {
    func getLiveMatchesData(urlString: String) async throws -> Data {
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
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
}
