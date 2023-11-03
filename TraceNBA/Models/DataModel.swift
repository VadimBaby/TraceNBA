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
    let message: String?
    
    init(events: [MatchModel]) {
        self.events = events
        self.players = nil
        self.message = nil
    }
    
    init(players: [PlayerDataModel]) {
        self.players = players
        self.events = nil
        self.message = nil
    }
    
    
    init(message: String) {
        self.message = message
        self.players = nil
        self.events = nil
    }
}
