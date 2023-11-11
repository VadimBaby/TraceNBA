//
//  StatisticsMatchView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 10.11.2023.
//

import SwiftUI

extension StatisticsMatchView {
    @ViewBuilder func getTeamComparisonComponent(statistics: [StatisticsMatchModel]) -> some View {
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
    
    @ViewBuilder var progressView: some View {
        ProgressView()
            .tint(Color.white)
    }
    
    private func getScoringStatisticsItems(statistics: [StatisticsMatchModel], period: PeriodType) -> [StatisticsItemModel] {
        guard let statistic = statistics.first(where: { $0.period == period }) else { return [] }
        
        let groups = statistic.groups
        
        guard let scoreGroup = groups.first(where: { $0.groupName == .scoring }) else { return [] }
        
        return scoreGroup.statisticsItems
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
