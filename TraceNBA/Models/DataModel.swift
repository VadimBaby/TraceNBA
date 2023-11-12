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
    let message: String?
    
    init(events: [MatchModel]) {
        self.events = events
        self.players = nil
        self.message = nil
        self.statistics = nil
        self.highlights = nil
    }
    
    init(players: [PlayerDataModel]) {
        self.players = players
        self.events = nil
        self.message = nil
        self.statistics = nil
        self.highlights = nil
    }
    
    init(statistics: [StatisticsMatchModel]) {
        self.statistics = statistics
        self.events = nil
        self.players = nil
        self.message = nil
        self.highlights = nil
    }
    
    init(highlights: [HighlightModel]) {
        self.highlights = highlights
        self.statistics = nil
        self.events = nil
        self.players = nil
        self.message = nil
    }
    
    init(message: String) {
        self.message = message
        self.players = nil
        self.events = nil
        self.statistics = nil
        self.highlights = nil
    }
}
