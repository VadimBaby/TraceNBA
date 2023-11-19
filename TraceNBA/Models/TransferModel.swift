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
    
    init(player: PlayerModel, transferFrom: TeamModel? = nil, transferTo: TeamModel? = nil, fromTeamName: String, toTeamName: String, round: Int? = nil, pick: Int? = nil, id: Int, transferDateTimestamp: Int) {
        self.player = player
        self.transferFrom = transferFrom
        self.transferTo = transferTo
        self.fromTeamName = fromTeamName
        self.toTeamName = toTeamName
        self.round = round
        self.pick = pick
        self.id = id
        self.transferDateTimestamp = transferDateTimestamp
    }
}
