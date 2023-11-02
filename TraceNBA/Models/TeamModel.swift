//
//  TeamModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct TeamModel: Identifiable, Codable {
    let id: Int
    let name: String
    let nameCode: String
    let manager: ManagerModel?
    
    init(id: Int, name: String, nameCode: String) {
        self.id = id
        self.name = name
        self.nameCode = nameCode
        self.manager = nil
    }
    
    init(id: Int, name: String, nameCode: String, manager: ManagerModel?) {
        self.id = id
        self.name = name
        self.nameCode = nameCode
        self.manager = manager
    }
}
