//
//  SearchEntityModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import Foundation

struct SearchEntityModel: Codable, Identifiable {
    let id: Int
    let name: String
    let nameCode: String?
    let shortName: String
    let country: CountryModel
    let firstName: String?
    let lastName: String?
    let team: TeamModel?
    
    init(
        id: Int,
        name: String,
        nameCode: String? = nil,
        shortName: String,
        country: CountryModel,
        firstName: String? = nil,
        lastName: String? = nil,
        team: TeamModel? = nil
    ) {
        self.id = id
        self.name = name
        self.nameCode = nameCode
        self.shortName = shortName
        self.country = country
        self.firstName = firstName
        self.lastName = lastName
        self.team = team
    }
}
