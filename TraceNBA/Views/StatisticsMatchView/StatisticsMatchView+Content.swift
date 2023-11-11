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
                
                ListGroupStatisticsViewComponent(
                    statistics: statistics,
                    groupName: .scoring,
                    pickerSelection: pickerSelection) { value, total in
                        if let total {
                            ProgressCircleViewComponent(value: value, total: total)
                        } else {
                            Text("Total is nil")
                        }
                    }
                
                ListGroupStatisticsViewComponent(
                    statistics: statistics,
                    groupName: .other,
                    pickerSelection: pickerSelection) { value, _ in
                        NumberCircleViewComponent(value: value)
                    }
            }
            .padding()
        }
    }
    
    @ViewBuilder private func getBoxScoreView() -> some View {
        ScrollView {
            
        }
    }
}

#Preview {
    NavigationStack {
        StatisticsMatchView(matchModel: MatchModel(
            id: 11548663,
            tournament: nil,
            homeTeam: TeamModel(
                id: 3428,
                name: "Golden State Warriors",
                shortName: "Warriors",
                nameCode: "GSW"),
            awayTeam: TeamModel(
                id: 3413,
                name: "Sacramento Kings",
                shortName: "Kings",
                nameCode: "SAC"),
            homeScore: ScoreModel(
                current: 86,
                display: 86,
                period1: 28,
                period2: 28,
                period3: 18,
                period4: 12
            ),
            awayScore: ScoreModel(
                current: 85,
                display: 85,
                period1: 31,
                period2: 31,
                period3: 24,
                period4: 6
            ),
            startTimestamp: 1698890400
        ), dataService: MockDataService<DataModel>())
    }
}