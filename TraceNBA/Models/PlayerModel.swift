//
//  PlayerModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct PlayerDataModel: Codable {
    let player: PlayerModel
}

struct PlayerModel: Identifiable, Codable {
    let id: Int
    let name: String
    let firstName: String?
    let lastName: String?
    let shortName: String
    let position: String
    let country: CountryModel?
    let jerseyNumber: String?
    let height: Int?
    let dateOfBirthTimestamp: Int?
    let team: TeamModel?
    
    init(id: Int, name: String, firstName: String, lastName: String, shortName: String, position: String, country: CountryModel? = nil, jerseyNumber: String? = nil, height: Int? = nil, dateOfBirthTimestamp: Int? = nil, team: TeamModel? = nil) {
        self.id = id
        self.name = name
        self.firstName = firstName
        self.lastName = lastName
        self.shortName = shortName
        self.position = position
        self.jerseyNumber = jerseyNumber
        self.height = height
        self.dateOfBirthTimestamp = dateOfBirthTimestamp
        self.team = team
        self.country = country
    }
}
