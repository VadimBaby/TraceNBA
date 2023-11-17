//
//  PlayerProfileView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

extension PlayerProfileView {
    @ViewBuilder public var playerTitle: some View {
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

#Preview {
    NavigationStack {
        PlayerProfileView(
            player: FakeData.fakeLineupsMatch.home.players.first!.player,
            team: FakeData.fakeListLiveMatches.first!.homeTeam,
            dataService: MockDataService<DataModel>()
        )
    }
}
