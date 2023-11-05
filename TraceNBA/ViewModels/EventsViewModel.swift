//
//  EventsViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import Foundation
import Combine

final class EventsViewModel: ObservableObject {
    @Published private(set) var scheduleMatches: [MatchModel]? = nil
    
    @Published private(set) var dateSchedule: Date = Date() {
        didSet {
            self.scheduleMatches = nil
        }
    }
    
    private var tasks: [Task<Void, Never>] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        
        subcriberDateSchedule()
    }
    
    deinit {
        cancelAllCancellables()
    }
    
    func subcriberDateSchedule() {
        $dateSchedule
            .debounce(for: .seconds(1.5), scheduler: DispatchQueue.main)
            .sink { newDate in
                self.getScheduleMatches(date: newDate)
            }
            .store(in: &cancellables)
    }
    
    func getScheduleMatches(date: Date) {
        let task1 = Task {
            do {
                let events = try await getScheduleData(date: date)
                
                await MainActor.run {
                    scheduleMatches = events
                }
            } catch {
                await MainActor.run {
                    scheduleMatches = []
                }
                debugPrint(error)
            }
        }
        
        tasks.append(task1)
    }
    
    func getScheduleData(date: Date) async throws -> [MatchModel] {
        let data = try await dataService.getScheduleMatchesData(dateSchedule: date)
        
        let decodeData = try JSONDecoder().decode(DataModel.self, from: data)
        
        print(decodeData)
        
        guard let events = decodeData.events else { throw URLError(.badServerResponse) }
        
        let filteredEvents = events.filter { match in
            guard let tournament = match.tournament,
                  match.awayScore != nil && match.homeScore != nil else { return false }
            
            return tournament.uniqueTournament.id == Constants.tournament
        }
        
        return filteredEvents
    }
    
    func addDayToDateSchedule() {
        let newDate = Calendar.current.date(byAdding: .day, value: 1, to: dateSchedule)
        
        guard let newDate else { return }
        
        dateSchedule = newDate
    }
    
    func minusDayToDateSchedule() {
        let newDate = Calendar.current.date(byAdding: .day, value: -1, to: dateSchedule)
        
        guard let newDate else { return }
        
        dateSchedule = newDate
    }
    
    func cancelAllCancellables() {
        cancellables.forEach{ $0.cancel() }
        
        cancellables = Set<AnyCancellable>()
    }
    
    func cancelAllTasks() {
        tasks.forEach{ $0.cancel() }
        
        tasks = []
    }
}
