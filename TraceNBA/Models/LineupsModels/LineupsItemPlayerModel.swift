//
//  LineupsItemPlayerModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import Foundation

struct LineupsItemPlayerModel: Codable {
    let player: PlayerModel
    let shirtNumber: Int
    let jerseyNumber: String
    let position: String
    let statistics: PlayerStatisticsModel
}
