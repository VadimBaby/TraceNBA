//
//  PlayerProfileView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

extension PlayerProfileView {
    @ViewBuilder public func getStatisticsContent(seasons: [SeasonModel]) -> some View {
        PickerSeasonPlayerViewComponent(viewModel: viewModel)
        
        if let statistics = viewModel.statistics {
            if !viewModel.hasPlayerStatisticsError {
                StatisticsPlayerViewComponent(statistics: statistics)
            } else {
                VStackMaxHeight {
                    NoDataViewComponent(message: .noPlayerStatisticsRegularSeason)
                }
            }
        } else {
            VStackMaxHeight {
                ProgressView()
                    .tint(Color.white)
            }
        }
    }
    
    @ViewBuilder public var nearMatchesContent: some View {
        if viewModel.nextEvent == nil && viewModel.previousEvent == nil && !viewModel.hasNearEventError {
            VStackMaxHeight {
                ProgressView()
                    .tint(Color.white)
            }
        } else if viewModel.hasNearEventError {
            VStackMaxHeight {
                NoDataViewComponent(message: .noPlayerNearMatches)
            }
        } else {
            ScrollView {
                VStack {
                    if let previousEvent = viewModel.previousEvent {
                        NearMatchesItemComponent(
                            event: previousEvent,
                            typeEvent: .previousEvent,
                            dataService: dataService
                        )
                    }
                    
                    if let nextEvent = viewModel.nextEvent {
                        NearMatchesItemComponent(
                            event: nextEvent,
                            typeEvent: .nextMatch,
                            dataService: dataService
                        )
                    }
                    
                    PlugRectangleViewComponent()
                }
            }
        }
    }
    
    @ViewBuilder public var transferHistoryContent: some View {
        if let transferHistory = viewModel.transferHistory {
            if !transferHistory.isEmpty {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(transferHistory) { transfer in
                            TransferItemViewComponent(
                                transfer: transfer,
                                dataService: dataService
                            )
                        }
                        
                        PlugRectangleViewComponent()
                    }
                }
            } else {
                VStackMaxHeight {
                    NoDataViewComponent(message: .noPlayerTransferHistory)
                }
            }
        } else {
            VStackMaxHeight {
                ProgressView()
                    .tint(Color.white)
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
