//
//  SearchModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import Foundation

struct SearchModel: Codable {
    let entity: SearchEntityModel
    let type: TypeEntity
    
    init(entity: SearchEntityModel, type: String) {
        self.entity = entity
        self.type = TypeEntity(rawValue: type) ?? .player
    }
}
