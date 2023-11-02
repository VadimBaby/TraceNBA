//
//  PlayerModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct PlayerDataModel: Codable {
    let player: PlayerModel
}

struct PlayerModel: Identifiable, Codable {
    let id: Int
    let name: String
    let firstName: String
    let secondName: String
    let shortName: String
    let position: String
    let jerseyNumber: String
    let height: Int
    let dateOfBirthTimestamp: Int
    let team: TeamModel
}
