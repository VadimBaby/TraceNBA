//
//  DataModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct DataModel: Codable {
    let events: [MatchModel]?
    let players: [PlayerDataModel]?
    let statistics: [StatisticsMatchModel]?
    let highlights: [HighlightModel]?
    let incidents: [IncidentModel]?
    let player: PlayerModel?
    let message: String?
    
    init(
        events: [MatchModel]? = nil,
        players: [PlayerDataModel]? = nil,
        statistics: [StatisticsMatchModel]? = nil,
        highlights: [HighlightModel]? = nil,
        incidents: [IncidentModel]? = nil,
        player: PlayerModel? = nil,
        message: String? = nil
    ) {
        self.events = events
        self.players = players
        self.statistics = statistics
        self.highlights = highlights
        self.incidents = incidents
        self.player = player
        self.message = message
    }
}
