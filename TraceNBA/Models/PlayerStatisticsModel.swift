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
    let fieldGoalPct: Int?
    
    func getStatisticFromString(string: String) -> Int? {
        switch string {
        case "secondsPlayed":
            return self.secondsPlayed
        case "points":
            return self.points
        case "twoPointsMade":
            return self.twoPointsMade
        case "twoPointAttempts":
            return self.twoPointAttempts
        case "threePointsMade":
            return self.threePointsMade
        case "threePointAttempts":
            return self.threePointAttempts
        case "freeThrowsMade":
            return self.freeThrowsMade
        case "freeThrowAttempts":
            return self.freeThrowAttempts
        case "fieldGoalsMade":
            return self.fieldGoalsMade
        case "fieldGoalAttempts":
            return self.fieldGoalAttempts
        case "rebounds":
            return self.rebounds
        case "defensiveRebounds":
            return self.defensiveRebounds
        case "offensiveRebounds":
            return self.offensiveRebounds
        case "turnovers":
            return self.turnovers
        case "blocks":
            return self.blocks
        case "personalFouls":
            return self.personalFouls
        case "assists":
            return self.assists
        case "steals":
            return self.steals
        case "plusMinus":
            return self.plusMinus
        case "fieldGoalPct":
            return self.fieldGoalPct
        default:
            return nil
        }
    }
}
