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
    let text: String?
    
    init(events: [MatchModel]) {
        self.events = events
        self.players = nil
        self.text = nil
    }
    
    init(players: [PlayerDataModel]) {
        self.players = players
        self.events = nil
        self.text = nil
    }
    
    
    init(text: String) {
        self.text = text
        self.players = nil
        self.events = nil
    }
}
