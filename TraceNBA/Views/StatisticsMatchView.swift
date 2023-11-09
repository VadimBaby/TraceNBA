//
//  StatisticsMatchView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import SwiftUI

struct StatisticsMatchView: View {
    @State private var showBoxScore: Bool = false
    @State private var pickerSelection: PeriodType = .all
    
    let matchModel: MatchModel
    
    @StateObject private var viewModel: StatisticsMatchViewModel
    
    private let dataService: DataServiceProtocol
    
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
               let awayScore = matchModel.awayScore {
                
                content(
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

extension StatisticsMatchView {
    @ViewBuilder private func content(statistics: [StatisticsMatchModel], homeScore: ScoreModel, awayScore: ScoreModel) -> some View {
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
                
                ForEach(getScoringStatisticsItems(
                    statistics: statistics,
                    period: pickerSelection), id: \.name.rawValue) { statisticsItem in
                        if let totalHome = statisticsItem.homeTotal,
                           let totalAway = statisticsItem.awayTotal {
                            getScoreStatisticItemView(
                                statisticsItem: statisticsItem,
                                totalHome: totalHome,
                                totalAway: totalAway
                            )
                        }
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder private func getBoxScoreView() -> some View {
        ScrollView {
            
        }
    }
    
    private func getScoringStatisticsItems(statistics: [StatisticsMatchModel], period: PeriodType) -> [StatisticsItemModel] {
        guard let statistic = statistics.first(where: { $0.period == period }) else { return [] }
        
        let groups = statistic.groups
        
        guard let scoreGroup = groups.first(where: { $0.groupName == .scoring }) else { return [] }
        
        return scoreGroup.statisticsItems
    }
}

extension StatisticsMatchView {
    @ViewBuilder private func getTeamComparisonComponent(statistics: [StatisticsMatchModel]) -> some View {
        HStack(alignment: .bottom) {
            Text("Team comparison")
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            PeriodPickerViewComponent(
                pickerSelection: $pickerSelection,
                statistics: statistics
            )
        }
        .foregroundStyle(Color.white)
    }
    
    @ViewBuilder private func getScoreStatisticItemView(statisticsItem: StatisticsItemModel, totalHome: Int, totalAway: Int) -> some View {
        HStack {
            ProgressCircleViewComponent(
                value: statisticsItem.homeValue,
                total: totalHome
            )
            
            Text(statisticsItem.name.rawValue)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.white)
                .font(.title2)
            
            ProgressCircleViewComponent(
                value: statisticsItem.awayValue,
                total: totalAway
            )
        }
        .padding()
    }
    
    @ViewBuilder private var progressView: some View {
        ProgressView()
            .tint(Color.white)
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
