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
    
    var listLiveMatches: [MatchModel] = [
        MatchModel(
            id: 11548663,
            homeTeam: TeamModel(
                id: 3428,
                name: "Golden State Warriors",
                nameCode: "GSW"),
            awayTeam: TeamModel(
                id: 3413,
                name: "Sacramento Kings",
                nameCode: "SAC"),
            homeScore: ScoreModel(
                current: 86,
                display: 86,
                period1: 28,
                period2: 28,
                period3: 18,
                period4: 12
            ),
            awayScore: ScoreModel(
                current: 85,
                display: 85,
                period1: 31,
                period2: 31,
                period3: 24,
                period4: 6
            ),
            startTimestamp: 1698890400
        ),
        MatchModel(
            id: 11548667,
            homeTeam: TeamModel(
                id: 3427,
                name: "Los Angeles Lakers",
                nameCode: "LAL"),
            awayTeam: TeamModel(
                id: 3425,
                name: "Los Angeles Clippers",
                nameCode: "LAC"),
            homeScore: ScoreModel(
                current: 81,
                display: 81,
                period1: 24,
                period2: 24,
                period3: 33
            ),
            awayScore: ScoreModel(
                current: 82,
                display: 82,
                period1: 37,
                period2: 24,
                period3: 21
            ),
            startTimestamp: 1698890400
        )
    ]
    
    init(data: AnyData? = nil) {
        anyData = data
    }
    
    func getLiveMatchesData() async throws -> Data {
        
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel: DataModel = DataModel(events: self.listLiveMatches)
            
            let data = try JSONEncoder().encode(dataModel)
            
            return data
        }
    }
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> Data {
        
        let managers: [String] = ["manager1", "manager2"]
        let teams: [String] = ["team1", "team2"]
        let players: [String] = ["player1", "player2"]
        
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
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
    
    private func encodeRandomImageFromList(list: [String]) throws -> Data {
        guard let randomNameImage = list.randomElement() else { throw Errors.listIsEmpty }
        
        guard let uiImage = UIImage(named: randomNameImage) else { throw Errors.badImage }
        
        guard let data = uiImage.pngData() else { throw Errors.badImage }
        
        return data
    }
}
