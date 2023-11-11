//
//  LineupsItemMissingPlayerModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import Foundation

struct LineupsItemMissingPlayerModel: Codable {
    let player: PlayerModel
    let type: String
    let reason: Int
}
