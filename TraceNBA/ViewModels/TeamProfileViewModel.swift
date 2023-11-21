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
    @Published private(set) var hasErrorTeamDetails: Bool = false
    
    private let id: Int
    private let dataService: DataServiceProtocol
    
    private var tasks: [Task<Void, Never>] = []
    
    init(id: Int, dataService: DataServiceProtocol) {
        self.id = id
        self.dataService = dataService
    }
    
    func getTeamDetails() {
        let task = Task {
            await asyncGetTeamDetails(isRefresh: false)
        }
        
        tasks.append(task)
    }
    
    func asyncGetTeamDetails(isRefresh: Bool) async {
        await MainActor.run {
            teamDetails = nil
            self.hasErrorTeamDetails = false
        }
        
        do {
            let teamDetails = try await getTeamDetailsData(id: self.id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.teamDetails = teamDetails
                self.hasErrorTeamDetails = false
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.teamDetails = nil
                self.hasErrorTeamDetails = true
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
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        
        tasks = []
    }
}
