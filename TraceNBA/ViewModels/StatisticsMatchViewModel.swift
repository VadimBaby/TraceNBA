//
//  StatisticsMatchViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import Foundation

class StatisticsMatchViewModel: ObservableObject {
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
}
