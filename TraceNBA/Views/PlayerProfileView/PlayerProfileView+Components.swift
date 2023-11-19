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
                        getNearMatchesItem(
                            event: previousEvent,
                            typeEvent: .previousEvent
                        )
                    }
                    
                    if let nextEvent = viewModel.nextEvent {
                        getNearMatchesItem(
                            event: nextEvent, 
                            typeEvent: .nextMatch
                        )
                    }
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
    
    @ViewBuilder public func getNearMatchesItem(event: MatchModel, typeEvent: TypeNearMatch) -> some View {
        VStack {
            Text(typeEvent.rawValue)
                .font(.title)
                .foregroundStyle(Color.white)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            NavigationLink(destination: {
                StatisticsMatchView(
                    matchModel: event,
                    dataService: dataService
                )
            }, label: {
                MatchItemViewComponent(
                    matchModel: event,
                    dataService: dataService
                )
                .tint(Color.black)
            })
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
