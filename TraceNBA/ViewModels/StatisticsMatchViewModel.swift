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
    @Published private(set) var highlights: [HighlightModel]? = nil
    @Published private(set) var incidents: [IncidentModel]? = nil
    
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
    
    func getLineupsMatch(id: Int) {
        guard homeMatchLineups == nil || awayMatchLineups == nil else { return }
        
        let task2 = Task {
            await asyncGetMatchLineups(id: id, isRefresh: false)
        }
        
        tasks.append(task2)
    }
    
    func getHighlights(id: Int) {
        guard highlights == nil else { return }
        
        let task3 = Task {
            await asyncGetMatchHighlights(id: id, isRefresh: false)
        }
        
        tasks.append(task3)
    }
    
    func getIncidents(id: Int) {
        guard incidents == nil else { return }
        
        let task4 = Task {
            await asyncGetMatchIncidents(id: id, isRefresh: false)
        }
        
        tasks.append(task4)
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
                homeMatchLineups = LineupsItemModel(players: [], missingPlayers: [])
                awayMatchLineups = LineupsItemModel(players: [], missingPlayers: [])
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetMatchHighlights(id: Int, isRefresh: Bool) async {
        await MainActor.run {
            highlights = nil
        }
        do {
            let highlights = try await getMatchHighlightsData(id: id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.highlights = highlights
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                highlights = []
            }
            
            debugPrint(error)
        }
    }
    
    func asyncGetMatchIncidents(id: Int, isRefresh: Bool) async {
        await MainActor.run {
            incidents = nil
        }
        do {
            let incidents = try await getMatchIncidentsData(id: id, isRefresh: isRefresh)
            
            await MainActor.run {
                self.incidents = incidents
            }
        } catch Errors.cannotRefresh {
            print("Cannot refresh")
        } catch {
            await MainActor.run {
                incidents = []
            }
            
            debugPrint(error)
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
    
    private func getMatchHighlightsData(id: Int, isRefresh: Bool) async throws -> [HighlightModel] {
        let data = try await dataService.getMatchHighlights(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let highlights = decodeData.highlights else { throw Errors.dataIsNil }
        
        return highlights
    }
    
    private func getMatchIncidentsData(id: Int, isRefresh: Bool) async throws -> [IncidentModel] {
        let data = try await dataService.getMatchIncidents(id: id, isRefresh: isRefresh)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        guard let incidents = decodeData.incidents else { throw Errors.dataIsNil }
        
        return incidents
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        
        tasks = []
    }
}
