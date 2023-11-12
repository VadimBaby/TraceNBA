//
//  StatisticsMatchViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import Foundation

class StatisticsMatchViewModel: ObservableObject {
    @Published private(set) var statistics: [StatisticsMatchModel]? = nil
    @Published private(set) var homeMatchLineups: LineupsItemModel? = nil
    @Published private(set) var awayMatchLineups: LineupsItemModel? = nil
    
    let dataService: DataServiceProtocol
    
    var tasks: [Task<Void, Never>] = []
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func getStatisticsMatch(id: Int) {
        guard statistics == nil else { return }
        
        let task1 = Task {
            await asyncGetStatisticsMatch(id: id, isRefresh: false)
        }
        
        tasks.append(task1)
    }
    
    func asyncGetStatisticsMatch(id: Int, isRefresh: Bool) async {
        await MainActor.run {
            statistics = nil
        }
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
    
    func asyncGetMatchLineups(id: Int, isRefresh: Bool) async {
        await MainActor.run {
            homeMatchLineups = nil
            awayMatchLineups = nil
        }
        do {
            let lineups = try await getMatchLineupsData(id: id, isRefresh: isRefresh)
            
            await MainActor.run {
                homeMatchLineups = lineups.home
                awayMatchLineups = lineups.away
            }
            
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                homeMatchLineups = LineupsItemModel(players: nil, missingPlayers: nil)
                awayMatchLineups = LineupsItemModel(players: nil, missingPlayers: nil)
            }
            
            print(error.localizedDescription)
        }
    }
    
    private func getMatchLineupsData(id: Int, isRefresh: Bool) async throws -> LineupsDataModel {
        let data = try await dataService.getMatchLineups(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(LineupsDataModel.self, from: data)
        
        return decodeData
    }
    
    private func getStatisticsMatchData(id: Int, isRefresh: Bool) async throws -> [StatisticsMatchModel] {
        let data = try await dataService.getStatisticsMatchData(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let statistics = decodeData.statistics else { throw Errors.dataIsNil }
        
        return statistics
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        
        tasks = []
    }
}
