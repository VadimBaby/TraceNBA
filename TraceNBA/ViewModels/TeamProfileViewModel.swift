//
//  TeamProfileViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 20.11.2023.
//

import Foundation

class TeamProfileViewModel: ObservableObject {
    @Published private(set) var teamDetails: TeamModel? = nil
    
    private let id: Int
    private let dataService: DataServiceProtocol
    
    init(id: Int, dataService: DataServiceProtocol) {
        self.id = id
        self.dataService = dataService
    }
}
