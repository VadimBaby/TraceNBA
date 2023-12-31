//
//  StatisticsMatchView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import SwiftUI

struct StatisticsMatchView: View {
    @State var showTypeStatisticsView: TypeStatisticsView = .summary
    @State var pickerSelection: PeriodType = .all
    @State var showTeamAnimated: TypeShowTeam = .homeTeam
    @State var showTeam: TypeShowTeam = .homeTeam
    @State var sortedParameter: TypeTopTableItem = .pts
    @State var isAscending: Bool = true
    
    let matchModel: MatchModel
    
    @StateObject public var viewModel: StatisticsMatchViewModel
    
    let dataService: DataServiceProtocol
    
    init(matchModel: MatchModel, dataService: DataServiceProtocol) {
        self.matchModel = matchModel
        self._viewModel = StateObject(wrappedValue: StatisticsMatchViewModel(dataService: dataService))
        self.dataService = dataService
    }
    
    var body: some View {
        ZStack {
            GradientComponent()
            
            if let statistics = viewModel.statistics,
               let homeScore = matchModel.homeScore,
               let awayScore = matchModel.awayScore,
               !statistics.isEmpty {
                
                content(
                    id: matchModel.id,
                    statistics: statistics,
                    homeScore: homeScore,
                    awayScore: awayScore
                )
                
            } else if viewModel.statistics == nil {
                progressView
            } else {
                NoDataViewComponent(message: .noStatisticsMatch)
            }
        }
        .onAppear {
            viewModel.getStatisticsMatch(id: matchModel.id)
        }
        .onDisappear {
            viewModel.cancelAllTasks()
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
