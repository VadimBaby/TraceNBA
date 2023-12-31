//
//  PlayerProfileView+Content.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

extension PlayerProfileView {
    @ViewBuilder public func getContent(player: PlayerModel) -> some View {
        VStack {
            TitlePlayerViewComponent(
                player: player,
                dataService: dataService
            )
            
            PickerTypeEntityPlayerViewComponent(showTypeEntityPlayer: $showTypeEntityPlayer)
            
            if let seasons = viewModel.seasons {
                if !seasons.isEmpty {
                    getViewContent(seasons: seasons)
                } else {
                    VStackMaxHeight {
                        NoDataViewComponent(message: .noPlayerSeasons)
                    }
                }
            } else {
                VStackMaxHeight {
                    ProgressView()
                        .tint(Color.white)
                }
            }
        }
        .onAppear {
            viewModel.getPlayerSeasons()
        }
    }
    
    @ViewBuilder public func getViewContent(seasons: [SeasonModel]) -> some View {
        if showTypeEntityPlayer == .statistics {
            getStatisticsContent(seasons: seasons)
        } else if showTypeEntityPlayer == .nearMatches {
            nearMatchesContent
                .onAppear {
                    viewModel.getPlayerNearMatches()
                }
        } else if showTypeEntityPlayer == .transferHistory {
            transferHistoryContent
                .onAppear {
                    viewModel.getPlayerTransferHistory()
                }
        } else if showTypeEntityPlayer == .media {
            HighlightsViewComponent(
                highlights: viewModel.media,
                noDataMessage: .noPlayerMedia,
                dataService: dataService
            )
                .onAppear {
                    viewModel.getPlayerMedia()
                }
        }
    }
}

#Preview {
    NavigationStack {
        PlayerProfileView(
            idPlayer: 1,
            dataService: MockDataService<DataModel>()
        )
    }
}
