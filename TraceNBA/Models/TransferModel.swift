//
//  TransferModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 19.11.2023.
//

import Foundation

struct TransferModel: Codable, Identifiable {
    let player: PlayerModel
    let transferFrom: TeamModel?
    let transferTo: TeamModel?
    let fromTeamName: String
    let toTeamName: String
    let round: Int?
    let pick: Int?
    let id: Int
    let transferDateTimestamp: Int
}
