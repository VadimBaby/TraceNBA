//
//  VenueModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 20.11.2023.
//

import Foundation

struct VenueModel: Codable {
    let city: CityModel?
    let stadium: StadiumModel?
}

struct CityModel: Codable {
    let name: String
}

struct StadiumModel: Codable {
    let name: String
}
