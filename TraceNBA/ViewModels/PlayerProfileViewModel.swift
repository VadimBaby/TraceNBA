//
//  PlayerProfileViewModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import Foundation

class PlayerProfileViewModel: ObservableObject {
    let idPlayer: Int
    let dataService: DataServiceProtocol
    
    init(idPlayer: Int, dataService: DataServiceProtocol) {
        self.idPlayer = idPlayer
        self.dataService = dataService
    }
    
    
}
