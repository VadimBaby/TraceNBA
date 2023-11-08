//
//  StatisticsMatchView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import SwiftUI

struct StatisticsMatchView: View {
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
