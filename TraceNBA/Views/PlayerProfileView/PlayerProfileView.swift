//
//  PlayerProfileView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

struct PlayerProfileView: View {
    
    let player: PlayerModel
    let team: TeamModel
    let dataService: DataServiceProtocol
    
    @StateObject public var viewModel: PlayerProfileViewModel
    
    init(player: PlayerModel, team: TeamModel, dataService: DataServiceProtocol) {
        self.player = player
        self.team = team
        self.dataService = dataService
        self._viewModel = StateObject(wrappedValue: PlayerProfileViewModel(
            idPlayer: player.id,
            dataService: dataService
        ))
    }
    
    var body: some View {
        ZStack {
            GradientComponent()
            
            VStack {
                playerTitle
                
                ScrollView {
                    
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) { centerToolbarItem }
        }
        .navigationBarBackButtonHidden(false)
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
