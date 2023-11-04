//
//  MatchModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct MatchModel: Identifiable, Codable {
    let id: Int
    let tournament: TournamentModel?
    let homeTeam: TeamModel
    let awayTeam: TeamModel
    let homeScore: ScoreModel?
    let awayScore: ScoreModel?
    let startTimestamp: Int
    
    init(id: Int, tournament: TournamentModel? = nil, homeTeam: TeamModel, awayTeam: TeamModel, homeScore: ScoreModel? = nil, awayScore: ScoreModel? = nil, startTimestamp: Int) {
        self.id = id
        self.tournament = tournament
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.startTimestamp = startTimestamp
    }
}
