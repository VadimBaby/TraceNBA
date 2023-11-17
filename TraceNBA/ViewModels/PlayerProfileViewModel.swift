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
    
    var tasks: [Task<Void, Never>] = []
    
    init(idPlayer: Int, dataService: DataServiceProtocol) {
        self.idPlayer = idPlayer
        self.dataService = dataService
    }
    
    func getPlayerDetails() {
        let task1 = Task {
            await asyncGetPlayerDetails(isRefresh: false)
        }
        
        tasks.append(task1)
    }
    
    func asyncGetPlayerDetails(isRefresh: Bool) async {
        await MainActor.run {
            self.player = nil
        }
        
        do {
            let player = try await getPlayerDetailsData(id: self.idPlayer, isRefresh: isRefresh)
            
            await MainActor.run {
                self.player = player
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.player = PlayerModel(
                    id: 1,
                    name: "error",
                    firstName: "error",
                    lastName: "error",
                    shortName: "error",
                    position: "error",
                    error: Errors.badDate
                )
            }
            
            debugPrint(error)
        }
    }
    
    private func getPlayerDetailsData(id: Int, isRefresh: Bool) async throws -> PlayerModel {
        let data = try await dataService.getPlayerDetails(id: id, isRefresh: isRefresh)
        
        return try JSONDecoder().decode(PlayerModel.self, from: data)
    }
}
