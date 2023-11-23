//
//  TeamProfileViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 20.11.2023.
//

import Foundation

class TeamProfileViewModel: ObservableObject {
    @Published private(set) var teamDetails: TeamModel? = nil
    @Published private(set) var previousEvent: MatchModel? = nil
    @Published private(set) var nextEvent: MatchModel? = nil
    @Published private(set) var players: [PlayerDataModel]? = nil
    @Published private(set) var media: [HighlightModel]? = nil
    @Published private(set) var hasTeamDetailsError: Bool = false
    @Published private(set) var hasNearMatchesError: Bool = false
    
    private let id: Int
    private let dataService: DataServiceProtocol
    
    private var tasks: [Task<Void, Never>] = []
    
    init(id: Int, dataService: DataServiceProtocol) {
        self.id = id
        self.dataService = dataService
    }
    
    func getTeamDetails() {
        guard self.teamDetails == nil else { return }
        
        let task = Task {
            await asyncGetTeamDetails(isRefresh: false)
        }
        
        tasks.append(task)
    }
    
    func getTeamNearMatches() {
        guard self.previousEvent == nil && self.nextEvent == nil else { return }
        
        let task = Task {
            await asyncGetTeamNearMatches(isRefresh: false)
        }
        
        tasks.append(task)
    }
    
    func getTeamPlayers() {
        guard self.players == nil else { return }
        
        let task = Task {
            await asyncGetTeamPlayers(isRefresh: false)
        }
        
        tasks.append(task)
    }
    
    func getTeamMedia() {
        guard self.media == nil else { return }
        
        let task = Task {
            await asyncGetTeamMedia(isRefresh: false)
        }
        
        tasks.append(task)
    }
    
    func asyncGetTeamDetails(isRefresh: Bool) async {
        await MainActor.run {
            teamDetails = nil
            self.hasTeamDetailsError = false
        }
        
        do {
            let teamDetails = try await getTeamDetailsData(id: self.id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.teamDetails = teamDetails
                self.hasTeamDetailsError = false
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.teamDetails = nil
                self.hasTeamDetailsError = true
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetTeamNearMatches(isRefresh: Bool) async {
        await MainActor.run {
            self.nextEvent = nil
            self.previousEvent = nil
            self.hasNearMatchesError = false
        }
        
        do {
            let dataModel = try await getTeamNearMatchesData(id: self.id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.previousEvent = dataModel.previousEvent
                self.nextEvent = dataModel.nextEvent
                self.hasNearMatchesError = false
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.nextEvent = nil
                self.previousEvent = nil
                self.hasNearMatchesError = true
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetTeamPlayers(isRefresh: Bool) async {
        await MainActor.run {
            self.players = nil
        }
        
        do {
            let players = try await getTeamPlayersData(id: self.id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.players = players
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.players = []
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetTeamMedia(isRefresh: Bool) async {
        await MainActor.run {
            self.media = nil
        }
        
        do {
            let media = try await getTeamMediaData(id: self.id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.media = media
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.media = []
            }
            
            debugPrint(error)
        }
    }
    
    private func getTeamDetailsData(id: Int, isRefresh: Bool) async throws -> TeamModel {
        let data = try await dataService.getTeamDetails(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let team = decodeData.team else { throw Errors.dataIsNil }
        
        return team
    }
    
    private func getTeamNearMatchesData(id: Int, isRefresh: Bool) async throws -> DataModel {
        let data = try await dataService.getTeamNearMatches(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        return decodeData
    }
    
    private func getTeamPlayersData(id: Int, isRefresh: Bool) async throws -> [PlayerDataModel] {
        let data = try await dataService.getTeamPlayers(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let players = decodeData.players else { throw Errors.dataIsNil }
        
        return players
    }
    
    private func getTeamMediaData(id: Int, isRefresh: Bool) async throws -> [HighlightModel] {
        let data = try await dataService.getTeamMedia(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let media = decodeData.media else { throw Errors.dataIsNil }
        
        return media
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        
        tasks = []
    }
}
