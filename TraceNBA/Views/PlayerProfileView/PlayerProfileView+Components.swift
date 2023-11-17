//
//  PlayerProfileView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

extension PlayerProfileView {
    @ViewBuilder public func getPlayerTitle(player: PlayerModel) -> some View {
        VStack {
            ImageViewComponent(
                id: player.id,
                typeEntiy: .player,
                imageScale: 130,
                colorProgressView: Color.white,
                dataService: dataService
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(spacing: 5) {
                Text(player.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
                if let team = player.team {
                    HStack {
                        Text(team.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(uiColor: UIColor.lightText))
                        
                        ImageViewComponent(
                            id: team.id,
                            typeEntiy: .team,
                            imageScale: 30,
                            colorProgressView: Color.white,
                            dataService: dataService
                        )
                    }
                }
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
