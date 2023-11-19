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
                    ScrollView {
                        
                    }
                } else {
                    NoDataViewComponent(message: .noPlayerSeasons)
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
}

#Preview {
    NavigationStack {
        PlayerProfileView(
            idPlayer: 1,
            dataService: MockDataService<DataModel>()
        )
    }
}
