//
//  PlayerProfileViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import Foundation

class PlayerProfileViewModel: ObservableObject {
    @Published private(set) var player: PlayerModel? = nil
    @Published private(set) var seasons: [SeasonModel]? = nil
    @Published private(set) var statistics: PlayerStatisticsModel? = nil
    @Published private(set) var isActiveSeason: SeasonModel? = nil
    
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
    
    func getPlayerSeasons() {
        let task = Task {
            await asyncGetPlayerSeasons(isRefresh: false)
        }
        
        tasks.append(task)
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
                    error: Errors.dataIsNil
                )
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetPlayerSeasons(isRefresh: Bool) async {
        await MainActor.run {
            self.seasons = nil
            self.isActiveSeason = nil
        }
        
        do {
            let seasons = try await getPlayerSeasonsData(id: self.idPlayer, isRefresh: isRefresh)
            
            await MainActor.run {
                self.seasons = seasons
                self.isActiveSeason = seasons.first
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.seasons = []
                self.isActiveSeason = nil
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetPlayerStatisticsRegularSeason(idSeason: Int, isRefresh: Bool) async {
        await MainActor.run {
            self.statistics = nil
        }
        
        do {
            let statistics = try await getPlayerStatisticsRegularSeasonData(idPlayer: idSeason, idSeason: idSeason, isRefresh: isRefresh)
            
            await MainActor.run {
                self.statistics = statistics
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.statistics = nil
            }
            
            debugPrint(error)
        }
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        
        tasks = []
    }
    
    private func getPlayerDetailsData(id: Int, isRefresh: Bool) async throws -> PlayerModel {
        let data = try await dataService.getPlayerDetails(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(PlayerDataModel.self, from: data)
        
        return decodeData.player
    }
    
    private func getPlayerSeasonsData(id: Int, isRefresh: Bool) async throws -> [SeasonModel] {
        let data = try await dataService.getPlayerSeasons(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let uniqueTournamentSeasons = decodeData.uniqueTournamentSeasons else { throw URLError(.badServerResponse) }
        
        let uniqueTournamentSeasonsItem = uniqueTournamentSeasons.first { $0.uniqueTournament.id == Constants.tournament }
        
        guard let uniqueTournamentSeasonsItem else { throw Errors.dataIsNil }
        
        return uniqueTournamentSeasonsItem.seasons
    }
    
    private func getPlayerStatisticsRegularSeasonData(idPlayer: Int, idSeason: Int, isRefresh: Bool) async throws -> PlayerStatisticsModel {
        let data = try await dataService.getPlayerStatisticsRegularSeason(
            idPlayer: idPlayer,
            idSeason: idSeason,
            isRefresh: isRefresh
        )
        
        let decodeData = try JSONDecoder().decode(PlayerStatisticsDataModel.self, from: data)
        
        return decodeData.statistics
    }
}
