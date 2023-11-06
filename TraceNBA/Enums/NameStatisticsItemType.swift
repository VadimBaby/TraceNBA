//
//  NameStatisticsItemType.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 07.11.2023.
//

import Foundation

enum NameStatisticsItemType: String, Codable {
    case freeThrows = "Free throws"
    case twoPointsThrows = "2 pointers"
    case threePointsThrows = "3 pointers"
    case fieldGoals = "Fields goals"
    case rebounds = "Rebounds"
    case defensiveRebounds = "Defensive rebounds"
    case offensiveRebounds = "Offensive rebounds"
    case assists = "Assists"
    case turnovers = "Turnovers"
    case steals = "Steals"
    case blocks = "Blocks"
    case fouls = "Fouls"
    case maxPointsInRow = "Max points in a row"
    case timeSpentInLead = "Time spent in lead"
    case biggestLead = "Biggest lead"
    case unknown = "Unknown NameStatisticsItemType"
}
