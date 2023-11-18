//
//  UniqueTournamentSeasonsItem.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 18.11.2023.
//

import Foundation

struct UniqueTournamentSeasonsItem: Codable {
    let uniqueTournament: TournamentModel
    let seasons: [SeasonModel]
}
