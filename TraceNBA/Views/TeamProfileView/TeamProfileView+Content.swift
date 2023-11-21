//
//  TeamProfileView+Content.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

extension TeamProfileView {
    @ViewBuilder public var content: some View {
        if showTypeEntityTeam == .nearMatches {
            nearMatchesContent
                .onAppear {
                    viewModel.getTeamNearMatches()
                }
        } else if showTypeEntityTeam == .teamPlayers {
            players
                .onAppear {
                    viewModel.getTeamPlayers()
                }
        } else if showTypeEntityTeam == .media {
            HighlightsViewComponent(
                highlights: viewModel.media,
                noDataMessage: .noTeamMedia,
                dataService: dataService
            )
                .onAppear {
                    viewModel.getTeamMedia()
                }
        }
    }
}

#Preview {
    TeamProfileView(
        id: 1,
        dataService: MockDataService<DataModel>()
    )
}
