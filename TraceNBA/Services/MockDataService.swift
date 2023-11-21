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
    
    init(data: AnyData? = nil) {
        anyData = data
    }
    
    func getLiveMatchesData(isRefresh: Bool) async throws -> Data {
        let codableModel: DataModel = DataModel(events: FakeData.fakeListLiveMatches)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getScheduleMatchesData(dateSchedule: Date, isRefresh: Bool) async throws -> Data {
        let codableModel: DataModel = DataModel(events: FakeData.fakeListLiveMatches)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
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
        let codableModel = DataModel(statistics: FakeData.fakeStatisticsMatches)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getMatchLineups(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel: LineupsDataModel = FakeData.fakeLineupsMatch
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getMatchHighlights(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(highlights: FakeData.fakeMatchHighlights)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getImageFromUrl(urlString: String) async throws -> Data {
        return try await getData(isRefresh: false)
    }
    
    func getMatchIncidents(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(incidents: FakeData.fakeMatchIncidents)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getPlayerDetails(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = PlayerDataModel(player: FakeData.fakePlayerDetails)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getPlayerSeasons(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(uniqueTournamentSeasons: FakeData.fakePlayerSeasons)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getPlayerStatisticsRegularSeason(idPlayer: Int, idSeason: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = PlayerStatisticsDataModel(statistics: FakeData.fakePlayerStatistics)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getPlayerNearMatches(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(
            previousEvent: FakeData.fakeListLiveMatches.first,
            nextEvent: FakeData.fakeListLiveMatches.last
        )
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getPlayerTransferHistory(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(transferHistory: FakeData.fakePlayerTransferHistory)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getPlayerMedia(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(media: FakeData.fakeMatchHighlights)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getTeamDetails(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(team: FakeData.fakeTeam)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getTeamNearMatches(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(
            previousEvent: FakeData.fakeListLiveMatches.first,
            nextEvent: FakeData.fakeListLiveMatches.last
        )
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    func getTeamPlayers(id: Int, isRefresh: Bool) async throws -> Data {
        let codableModel = DataModel(players: FakeData.fakeListPlayers)
        
        return try await getData(isRefresh: isRefresh, codableModel: codableModel)
    }
    
    private func getData(isRefresh: Bool, codableModel: Codable? = nil) async throws -> Data {
        if isRefresh {
            throw Errors.cannotRefresh
        }
        
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        }
        
        if let codableModel {
            let dataEncode = try JSONEncoder().encode(codableModel)
            
            return dataEncode
        }
        
        return try JSONEncoder().encode("")
    }
    
    private func encodeRandomImageFromList(list: [String]) throws -> UIImage {
        guard let randomNameImage = list.randomElement() else { throw Errors.listIsEmpty }
        
        guard let uiImage = UIImage(named: randomNameImage) else { throw Errors.badImage }
        
        return uiImage
    }
}
