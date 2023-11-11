//
//  StatisticsMatchView+content.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 10.11.2023.
//

import SwiftUI

extension StatisticsMatchView {
    @ViewBuilder func content(statistics: [StatisticsMatchModel], homeScore: ScoreModel, awayScore: ScoreModel) -> some View {
        VStack {
            MatchViewComponent(
                match: matchModel,
                homeScore: homeScore,
                awayScore: awayScore,
                dataService: dataService
            )
            
            PickerStatisticsViewComponent(showBoxScore: $showBoxScore)
            
            if showBoxScore {
                getBoxScoreView()
            } else {
                getSummaryView(
                    statistics: statistics,
                    homeScore: homeScore,
                    awayScore: awayScore
                )
            }
        }
    }
    
    @ViewBuilder private func getSummaryView(statistics: [StatisticsMatchModel], homeScore: ScoreModel, awayScore: ScoreModel) -> some View {
        ScrollView {
            VStack {
                ScoreTableViewComponent(
                    homeNameCode: matchModel.homeTeam.nameCode,
                    awayHomeCode: matchModel.awayTeam.nameCode,
                    homeScore: homeScore,
                    awayScore: awayScore
                )
                
                getTeamComparisonComponent(statistics: statistics)
                
                getScoringStatistics(statistics: statistics)
            }
            .padding()
        }
    }
    
    @ViewBuilder private func getBoxScoreView() -> some View {
        ScrollView {
            
        }
    }
}
