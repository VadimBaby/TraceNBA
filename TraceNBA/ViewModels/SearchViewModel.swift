//
//  SearchViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
}
