//
//  StreamMatchesViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

class StreamMatchesViewModel: ObservableObject {
    @Published private(set) var listLiveMatches: [MatchModel] = []
    
    private let manager: DataServiceProtocol
    
    private var tasks: [Task<Void, Never>] = []
    
    init(manager: DataServiceProtocol) {
        self.manager = manager
    }
    
    func getListLiveMatches() {
        let task1 = Task {
            do {
                let events = try await getLiveMatches()
                
                await MainActor.run {
                    listLiveMatches = events
                }
            } catch {
                await MainActor.run {
                    listLiveMatches = []
                }
                print(error.localizedDescription)
            }
        }
        
        tasks.append(task1)
    }
    
    private func getLiveMatches() async throws -> [MatchModel] {
        let data = try await manager.getLiveMatchesData()
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let events = decodeData.events else { throw URLError(.badServerResponse) }
        
        return events
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        tasks = []
    }
    
    func getLiveMatches_Tests() async throws -> [MatchModel] {
        return try await getLiveMatches()
    }
}
