//
//  EventsViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import Foundation

final class EventsViewModel: ObservableObject {
    
    @Published private(set) var dateSchedule: Date = Date()
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
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
}
