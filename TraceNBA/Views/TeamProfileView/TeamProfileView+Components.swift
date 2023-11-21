//
//  TeamProfileView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

extension TeamProfileView {
    @ViewBuilder public var nearMatchesContent: some View {
        if viewModel.nextEvent == nil && viewModel.previousEvent == nil && !viewModel.hasNearMatchesError {
            VStackMaxHeight {
                ProgressView()
                    .tint(Color.white)
            }
        } else if viewModel.hasNearMatchesError {
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
                }
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
