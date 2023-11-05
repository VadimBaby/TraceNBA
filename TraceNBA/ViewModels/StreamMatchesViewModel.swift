//
//  StreamMatchesViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

final class StreamMatchesViewModel: ObservableObject {
    @Published private(set) var listLiveMatches: [MatchModel]? = nil
    
    private let manager: DataServiceProtocol
    
    private var tasks: [Task<Void, Never>] = []
    
    init(manager: DataServiceProtocol) {
        self.manager = manager
    }
    
    func getListLiveMatches() {
        let task1 = Task {
            await asyncGetListLiveMatches(isRefresh: false)
        }
        
        tasks.append(task1)
    }
    
    func asyncGetListLiveMatches(isRefresh: Bool) async {
        do {
            let events = try await getLiveMatches(isRefresh: isRefresh)
            
            await MainActor.run {
                listLiveMatches = events
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                listLiveMatches = []
            }
            
            print(error.localizedDescription)
        }
    }
    
    private func getLiveMatches(isRefresh: Bool) async throws -> [MatchModel] {
        let data = try await manager.getLiveMatchesData(isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let events = decodeData.events else { throw URLError(.badServerResponse) }
        
        let filteredEvents = events.filter { match in
            guard let tournament = match.tournament,
                  match.awayScore != nil && match.homeScore != nil else { return false }
            
            return tournament.uniqueTournament.id == Constants.tournament
        }
        
        return filteredEvents
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        tasks = []
    }
    
    func getLiveMatches_Tests() async throws -> [MatchModel] {
        return try await getLiveMatches(isRefresh: false)
    }
}
