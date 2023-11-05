//
//  EventsViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import Foundation

final class EventsViewModel: ObservableObject {
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
}
