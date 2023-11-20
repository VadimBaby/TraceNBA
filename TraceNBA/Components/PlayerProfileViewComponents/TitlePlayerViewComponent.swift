//
//  TitlePlayerViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 18.11.2023.
//

import SwiftUI

struct TitlePlayerViewComponent: View {
    
    let player: PlayerModel
    let dataService: DataServiceProtocol
    
    var body: some View {
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

extension TitlePlayerViewComponent {
    @ViewBuilder public func getNamePlayer(player: PlayerModel) -> some View {
        VStack(alignment: .leading) {
            if let firstName = player.firstName,
               let lastName = player.lastName,
               !firstName.isEmpty && !lastName.isEmpty {
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
    ZStack {
        GradientComponent()
        
        TitlePlayerViewComponent(
            player: FakeData.fakePlayerDetails,
            dataService: MockDataService<DataModel>()
        )
    }
}
