//
//  StatisticsMatchModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 07.11.2023.
//

import Foundation

struct StatisticsMatchModel: Codable {
    let period: PeriodType
    let groups: [GroupModel]
    
    init(period: String, groups: [GroupModel]) {
        self.groups = groups
        
        let periodOptional = PeriodType(rawValue: period)
        self.period = periodOptional ?? .unknown
    }
}
