//
//  TournamentModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 04.11.2023.
//

import Foundation

struct TournamentModel: Codable {
    let uniqueTournament: UniqueTournamentModel
}

struct UniqueTournamentModel: Codable, Identifiable {
    let name: String
    let slug: String
    let id: Int
}
