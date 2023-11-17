//
//  PlayerProfileView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

struct PlayerProfileView: View {
    
    let dataService: DataServiceProtocol
    
    @StateObject public var viewModel: PlayerProfileViewModel
    
    init(idPlayer: Int, dataService: DataServiceProtocol) {
        self.dataService = dataService
        self._viewModel = StateObject(wrappedValue: PlayerProfileViewModel(
            idPlayer: idPlayer,
            dataService: dataService
        ))
    }
    
    var body: some View {
        ZStack {
            GradientComponent()
            
            if let player = viewModel.player {
                if player.error == nil {
                    getContent(player: player)
                } else {
                    VStackMaxHeight {
                        NoDataViewComponent(message: .noPlayerDetails)
                    }
                }
            } else {
                VStackMaxHeight {
                    ProgressView()
                        .tint(Color.white)
                }
            }
        }
        .onAppear {
            viewModel.getPlayerDetails()
        }
        .onDisappear {
            viewModel.cancelAllTasks()
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
            idPlayer: 1,
            dataService: MockDataService<DataModel>()
        )
    }
}
