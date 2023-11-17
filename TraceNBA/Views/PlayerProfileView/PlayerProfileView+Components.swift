//
//  PlayerProfileView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

extension PlayerProfileView {
    @ViewBuilder public func getNamePlayer(player: PlayerModel) -> some View {
        VStack(alignment: .leading) {
            if let firstName = player.firstName,
               let lastName = player.lastName {
                Text(firstName)
                Text(lastName)
            } else {
                Text(player.name)
            }
        }
        .font(.title)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)
    }
    
    @ViewBuilder public func getNameTeamWithImage(player: PlayerModel) -> some View {
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
    
    @ViewBuilder public func getPlayerDetails(player: PlayerModel) -> some View {
        HStack {
            if let height = player.height {
                Text("Height: \(height)cm")
            }
            
            if let dateOfBirthTimestamp = player.dateOfBirthTimestamp,
               let years = dateOfBirthTimestamp.getYearsOld() {
                Text("Years: \(years)")
            }
        }
        .font(.headline)
        .foregroundStyle(Color(uiColor: UIColor.lightText))
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
