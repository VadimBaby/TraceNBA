//
//  PlayerProfileViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import Foundation

class PlayerProfileViewModel: ObservableObject {
    @Published private(set) var player: PlayerModel? = nil
    
    let idPlayer: Int
    let dataService: DataServiceProtocol
    
    init(idPlayer: Int, dataService: DataServiceProtocol) {
        self.idPlayer = idPlayer
        self.dataService = dataService
    }
    
    private func getPlayerDetailsData(id: Int, isRefresh: Bool) async throws -> PlayerModel {
        let data = try await dataService.getPlayerDetails(id: id, isRefresh: isRefresh)
        
        return try JSONDecoder().decode(PlayerModel.self, from: data)
    }
}
