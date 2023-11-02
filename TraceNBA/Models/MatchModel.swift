//
//  MatchModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct MatchModel: Identifiable {
    let id: Int
    let homeTeam: TeamModel
    let awayTeam: TeamModel
    let homeScore: ScoreModel
    let awayScore: ScoreModel
    let startTimestamp: Int
}
