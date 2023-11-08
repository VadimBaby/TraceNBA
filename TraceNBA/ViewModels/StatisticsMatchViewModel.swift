//
//  StatisticsMatchViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import Foundation

class StatisticsMatchViewModel: ObservableObject {
    @Published private(set) var statistics: [StatisticsMatchModel] = []
    
    let dataService: DataServiceProtocol
    
    var tasks: [Task<Void, Never>] = []
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func getStatisticsMatch(id: Int) {
        let task1 = Task {
            await asyncGetStatisticsMatch(id: id,isRefresh: false)
        }
        
        tasks.append(task1)
    }
    
    func asyncGetStatisticsMatch(id: Int, isRefresh: Bool) async {
        do {
            let statistics = try await getStatisticsMatchData(id: id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.statistics = statistics
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                self.statistics = []
            }
            
            print(error.localizedDescription)
        }
    }
    
    private func getStatisticsMatchData(id: Int, isRefresh: Bool) async throws -> [StatisticsMatchModel] {
        let data = try await dataService.getStatisticsMatchData(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let statistics = decodeData.statistics else { throw URLError(.badServerResponse) }
        
        return statistics
    }
}
