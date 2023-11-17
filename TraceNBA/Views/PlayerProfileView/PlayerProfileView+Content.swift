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
            getPlayerTitle(player: player)
            
            PickerTypeEntityPlayerViewComponent(showTypeEntityPlayer: $showTypeEntityPlayer)
            
            ScrollView {
                
            }
        }
    }
    
    @ViewBuilder public func getPlayerTitle(player: PlayerModel) -> some View {
        HStack(spacing: 15) {
            ImageViewComponent(
                id: player.id,
                typeEntiy: .player,
                imageScale: 110,
                colorProgressView: Color.white,
                dataService: dataService
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 5) {
                    getNamePlayer(player: player)
                    
                    getNameTeamWithImage(player: player)
                }
                
                getPlayerDetails(player: player)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
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
