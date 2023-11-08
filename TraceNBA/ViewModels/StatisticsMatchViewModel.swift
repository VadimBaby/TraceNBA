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
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    private func getStatisticsMatchData(id: Int, isRefresh: Bool) async throws -> [StatisticsMatchModel] {
        let data = try await dataService.getStatisticsMatchData(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let statistics = decodeData.statistics else { throw URLError(.badServerResponse) }
        
        return statistics
    }
}
