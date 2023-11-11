//
//  PlayerStatisticsModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import Foundation

struct PlayerStatisticsModel: Codable {
    let secondsPlayed: Int
    let points: Int
    let twoPointsMade: Int
    let twoPointAttempts: Int
    let threePointsMade: Int
    let threePointAttempts: Int
    let freeThrowsMade: Int
    let freeThrowAttempts: Int
    let fieldGoalsMade: Int
    let fieldGoalAttempts: Int
    let rebounds: Int
    let defensiveRebounds: Int
    let offensiveRebounds: Int
    let turnovers: Int
    let blocks: Int
    let personalFouls: Int
    let assists: Int
    let steals: Int
    let plusMinus: Int
    let fieldGoalPct: Int
}
