//
//  PlayerItemViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

struct PlayerItemViewComponent: View {
    
    let player: PlayerModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        HStack {
            ImageViewComponent(
                id: player.id,
                typeEntiy: .player,
                imageScale: 70,
                colorProgressView: Color.white,
                dataService: dataService
            )
            .clipShape(.rect(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text(player.name)
                
                if let dateOfBirthTimestamp = player.dateOfBirthTimestamp,
                   let years = dateOfBirthTimestamp.getYearsOld() {
                    Text("Age: " + years)
                }
            }
            .font(.title3)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        ScrollView {
            VStack(spacing: 20) {
                ForEach(FakeData.fakeListPlayers, id: \.player.id) { player in
                    PlayerItemViewComponent(
                        player: player.player,
                        dataService: MockDataService<DataModel>()
                    )
                }
            }
            .padding()
        }
    }
}
