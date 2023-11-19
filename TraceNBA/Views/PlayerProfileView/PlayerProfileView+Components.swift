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
}

#Preview {
    NavigationStack {
        PlayerProfileView(
            idPlayer: 1,
            dataService: MockDataService<DataModel>()
        )
    }
}
