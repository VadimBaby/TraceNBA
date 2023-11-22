//
//  SearchViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published private(set) var results: [SearchModel]? = nil
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    private func searchData(search: String, isRefresh: Bool) async throws -> [SearchModel] {
        guard !search.isEmpty else { throw Errors.searchIsEmpty }
        
        let data = try await dataService.search(search: search, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let results = decodeData.results else { throw Errors.dataIsNil }
        
        return results.filter { item in
            if item.type == .team {
                return item.entity.country.name == "USA"
            } else if item.type == .player {
                guard let team = item.entity.team,
                      let country = team.country else { return false }
                
                return country.name == "USA"
            }
            
            return false
        }
    }
}
