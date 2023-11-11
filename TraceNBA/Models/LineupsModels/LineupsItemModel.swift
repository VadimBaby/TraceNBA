//
//  LineupsItemModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import Foundation

struct LineupsItemModel: Codable {
    let players: [LineupsItemPlayerModel]
    let missingPlayers: [LineupsItemMissingPlayerModel]
}
