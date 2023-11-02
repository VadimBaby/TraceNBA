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
    
    init(events: [MatchModel]) {
        self.events = events
        self.players = nil
    }
    
    init(players: [PlayerDataModel]) {
        self.players = players
        self.events = nil
    }
}
