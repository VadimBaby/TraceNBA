//
//  MockDataService.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import SwiftUI

actor MockDataService<AnyData: Codable>: DataServiceProtocol {
    
    let anyData: AnyData?
    
    let listLiveMatches: [MatchModel] = FakeData.fakeListLiveMatches
    let statisticsMatches: [StatisticsMatchModel] = FakeData.fakeStatisticsMatches
    
    init(data: AnyData? = nil) {
        anyData = data
    }
    
    func getLiveMatchesData(isRefresh: Bool) async throws -> Data {
        if isRefresh {
            throw Errors.cannotRefresh
        }
        
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel: DataModel = DataModel(events: self.listLiveMatches)
            
            let data = try JSONEncoder().encode(dataModel)
            
            return data
        }
    }
    
    func getScheduleMatchesData(dateSchedule: Date, isRefresh: Bool) async throws -> Data {
        if isRefresh {
            throw Errors.cannotRefresh
        }
        
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel: DataModel = DataModel(events: self.listLiveMatches)
            
            let data = try JSONEncoder().encode(dataModel)
            
            return data
        }
    }
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> UIImage {
        
        let managers: [String] = ["manager1", "manager2"]
        let teams: [String] = ["team1", "team2"]
        let players: [String] = ["player1", "player2"]
        
        if let data = anyData, let imageData = data as? UIImage {
            return imageData
        } else {
            switch entity {
            case .team:
                return try encodeRandomImageFromList(list: teams)
            case .player:
                return try encodeRandomImageFromList(list: players)
            case .manager:
                return try encodeRandomImageFromList(list: managers)
            }
        }
    }
    
    func getStatisticsMatchData(id: Int, isRefresh: Bool) async throws -> Data {
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel = DataModel(statistics: self.statisticsMatches)
            
            let dataEncode = try JSONEncoder().encode(dataModel)
            
            return dataEncode
        }
    }
    
    func getMatchLineups(id: Int, isRefresh: Bool) async throws -> Data {
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel: LineupsDataModel = FakeData.fakeLineupsMatch
            
            let dataEncode = try JSONEncoder().encode(dataModel)
            
            return dataEncode
        }
    }
    
    func getMatchHighlights(id: Int, isRefresh: Bool) async throws -> Data {
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel = DataModel(highlights: FakeData.fakeMatchHighlights)
            
            let dataEncode = try JSONEncoder().encode(dataModel)
            
            return dataEncode
        }
    }
    
    private func encodeRandomImageFromList(list: [String]) throws -> UIImage {
        guard let randomNameImage = list.randomElement() else { throw Errors.listIsEmpty }
        
        guard let uiImage = UIImage(named: randomNameImage) else { throw Errors.badImage }
        
        return uiImage
    }
}
