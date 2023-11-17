//
//  StatisticsMatchView+content.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 10.11.2023.
//

import SwiftUI

extension StatisticsMatchView {
    @ViewBuilder func content(id: Int, statistics: [StatisticsMatchModel], homeScore: ScoreModel, awayScore: ScoreModel) -> some View {
            VStack {
                MatchViewComponent(
                    match: matchModel,
                    homeScore: homeScore,
                    awayScore: awayScore,
                    dataService: dataService
                )
                
                PickerStatisticsViewComponent(
                    showTypeStatisticsView: $showTypeStatisticsView
                )
                
                if showTypeStatisticsView == .summary {
                    getSummaryView(
                        statistics: statistics,
                        homeScore: homeScore,
                        awayScore: awayScore
                    )
                } else if showTypeStatisticsView == .box_score  {
                    boxScoreView
                        .onAppear {
                            viewModel.getLineupsMatch(id: id)
                        }
                } else if showTypeStatisticsView == .incidents {
                    incidentsView
                        .onAppear {
                            viewModel.getIncidents(id: id)
                        }
                } else if showTypeStatisticsView == .highlights {
                    highlightsView
                        .onAppear {
                            viewModel.getHighlights(id: id)
                        }
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
    
    @ViewBuilder private var boxScoreView: some View {
        if let homeLineups = viewModel.homeMatchLineups,
           let awayLineups = viewModel.awayMatchLineups {
            
            if homeLineups.players.isEmpty && awayLineups.players.isEmpty {
                VStackMaxHeight {
                    NoDataViewComponent(message: .noMatchLineups)
                }
            } else {
                ZStack(alignment: .bottom) {
                    if showTeam == .homeTeam {
                        LineupsPlayerTableViewComponent(
                            players: homeLineups.players, 
                            matchModel: matchModel,
                            sortedParameter: $sortedParameter,
                            isAscending: $isAscending, 
                            dataService: dataService
                        )
                    } else if showTeam == .awayTeam {
                        LineupsPlayerTableViewComponent(
                            players: awayLineups.players, 
                            matchModel: matchModel,
                            sortedParameter: $sortedParameter,
                            isAscending: $isAscending,
                            dataService: dataService
                        )
                    }
                    
                    PickerTeamViewComponent(
                        showTeam: $showTeam, 
                        showTeamAnimated: $showTeamAnimated,
                        nameHomeTeam: matchModel.homeTeam.shortName,
                        nameAwayTeam: matchModel.awayTeam.shortName
                    )
                    .padding()
                }
            }
            
        } else {
            VStackMaxHeight {
                progressView
            }
        }
    }
    
    @ViewBuilder private var incidentsView: some View {
        if let incidents = viewModel.incidents {
            if !incidents.isEmpty {
                ScrollView {
                    LazyVStack(spacing: 30) {
                        ForEach(incidents) { incident in
                            IncidentItemViewComponent(
                                incident: incident,
                                matchModel: matchModel,
                                dataService: dataService
                            )
                        }
                        
                        PlugRectangleViewComponent()
                    }
                    .padding()
                }
            } else {
                VStackMaxHeight {
                    NoDataViewComponent(message: .noMatchIncidents)
                }
            }
        } else {
            VStackMaxHeight {
                progressView
            }
        }
    }
    
    @ViewBuilder private var highlightsView: some View {
        if let highlights = viewModel.highlights {
            if !highlights.isEmpty {
                ScrollView {
                    VStack(spacing: 30) {
                        ForEach(highlights) { highlight in
                            HighlightsItemViewComponent(
                                highlight: highlight,
                                dataService: dataService
                            )
                        }
                        PlugRectangleViewComponent()
                    }
                    .padding()
                }
            } else {
                VStackMaxHeight {
                    NoDataViewComponent(message: .noMatchHighlights)
                }
            }
        } else {
            VStackMaxHeight {
                progressView
            }
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
