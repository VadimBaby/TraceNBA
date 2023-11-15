//
//  IncidentModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 15.11.2023.
//

import Foundation

struct IncidentModel: Codable, Identifiable {
    let homeScore: Int
    let awayScore: Int
    let player: PlayerModel?
    let id: Int?
    let time: Int
    let isHome: Bool?
    let incidentClass: TypeIncidentClass?
    let reversedPeriodTime: Int?
    let incidentType: IncidentType
    
    init(homeScore: Int, awayScore: Int, player: PlayerModel?, id: Int?, time: Int, isHome: Bool?, incidentClass: String?, reversedPeriodTime: Int?, incidentType: String) {
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.player = player
        self.id = id ?? Int.random(in: 1000..<9999)
        self.time = time
        self.isHome = isHome
        self.reversedPeriodTime = reversedPeriodTime
        self.incidentType = IncidentType(rawValue: incidentType) ?? .unknown
        
        if let incidentClass {
            self.incidentClass = TypeIncidentClass(rawValue: incidentClass) ?? .unknown
        } else {
            self.incidentClass = nil
        }
    }
}
