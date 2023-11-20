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
    let shortName: String
    let manager: ManagerModel?
    let venue: VenueModel?
    
    init(
        id: Int,
        name: String,
        shortName: String,
        nameCode: String,
        manager: ManagerModel? = nil,
        venue: VenueModel? = nil
    ) {
        self.id = id
        self.name = name
        self.shortName = shortName
        self.nameCode = nameCode
        self.manager = manager
        self.venue = venue
    }
}
