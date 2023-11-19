//
//  PlayerProfileViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import Foundation
import Combine

class PlayerProfileViewModel: ObservableObject {
    @Published private(set) var player: PlayerModel? = nil
    @Published private(set) var seasons: [SeasonModel]? = nil
    @Published private(set) var statistics: PlayerStatisticsModel? = nil
    @Published private(set) var isActiveSeason: SeasonModel? = nil
    @Published private(set) var previousEvent: MatchModel? = nil
    @Published private(set) var nextEvent: MatchModel? = nil
    @Published private(set) var playerTransferHistory: [TransferModel]? = nil
    @Published private(set) var hasPlayerStatisticsError: Bool = false
    @Published private(set) var hasNearEventError: Bool = false
    
    let idPlayer: Int
    let dataService: DataServiceProtocol
    
    private var tasks: [Task<Void, Never>] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(idPlayer: Int, dataService: DataServiceProtocol) {
        self.idPlayer = idPlayer
        self.dataService = dataService
        
        getSubcriber()
    }
    
    deinit {
        cancellables.forEach{ $0.cancel() }
        
        cancellables = []
    }
    
    func getSubcriber() {
        $isActiveSeason
            .debounce(for: .seconds(1.5), scheduler: DispatchQueue.main)
            .sink { newSeason in
                guard let season = newSeason else { return }
                
                self.getPlayerStatisticsRegularSeason(idSeason: season.id)
            }
            .store(in: &cancellables)
    }
    
    func setNextSeason() {
        guard let newSeason = getSeasonFromIndexOffset(offsetBy: -1) else { return }
        
        isActiveSeason = newSeason
        statistics = nil
    }
    
    func setPreviousSeason() {
        guard let newSeason = getSeasonFromIndexOffset(offsetBy: 1) else { return }
        
        isActiveSeason = newSeason
        statistics = nil
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
    
    func getPlayerStatisticsRegularSeason(idSeason: Int) {
        let task = Task {
            await asyncGetPlayerStatisticsRegularSeason(idSeason: idSeason, isRefresh: false)
        }
        
        tasks.append(task)
    }
    
    func getPlayerNearMatches() {
        let task = Task {
            await asyncGetPlayerNearMatches(isRefresh: false)
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
            self.hasPlayerStatisticsError = false
        }
        
        do {
            let statistics = try await getPlayerStatisticsRegularSeasonData(idPlayer: idPlayer, idSeason: idSeason, isRefresh: isRefresh)
            
            await MainActor.run {
                self.statistics = statistics
                self.hasPlayerStatisticsError = false
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.statistics = nil
                self.hasPlayerStatisticsError = true
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetPlayerNearMatches(isRefresh: Bool) async {
        await MainActor.run {
            self.previousEvent = nil
            self.nextEvent = nil
            self.hasNearEventError = false
        }
        
        do {
            let dataModel = try await getPlayerNearMatchesData(id: idPlayer, isRefresh: isRefresh)
            
            await MainActor.run {
                self.previousEvent = dataModel.previousEvent
                self.nextEvent = dataModel.nextEvent
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.previousEvent = nil
                self.nextEvent = nil
                self.hasNearEventError = true
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
        
        guard let statistics = decodeData.statistics else { throw Errors.dataIsNil }
        
        return statistics
    }
    
    private func getPlayerNearMatchesData(id: Int, isRefresh: Bool) async throws -> DataModel {
        let data = try await dataService.getPlayerNearMatches(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        return decodeData
    }
    
    private func getPlayerTransferHistory(id: Int, isRefresh: Bool) async throws -> [TransferModel] {
        let data = try await dataService.getPlayerTransferHistory(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let transferHistory = decodeData.transferHistory else { throw Errors.dataIsNil }
        
        return transferHistory
    }
    
    private func getSeasonFromIndexOffset(offsetBy: Int) -> SeasonModel? {
        guard let seasons = seasons,
              let isActiveSeason = isActiveSeason else { return nil }
        
        let index = seasons.firstIndex { $0.id == isActiveSeason.id }
        
        guard let index else { return nil }
        
        let newSeasonIndex = seasons.index(index, offsetBy: offsetBy)
        
        guard newSeasonIndex >= 0 && newSeasonIndex < seasons.count else { return nil }
        
        let newSeason = seasons[newSeasonIndex]
        
        return newSeason
    }
}
