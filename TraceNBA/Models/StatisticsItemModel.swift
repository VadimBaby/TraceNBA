//
//  StatisticsItemModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 07.11.2023.
//

import Foundation

struct StatisticsItemModel: Codable {
    let name: NameStatisticsItemType
    let home: String
    let away: String
    let valueType: ValueType
    let homeValue: Int
    let awayValue: Int
    let homeTotal: Int?
    let awayTotal: Int?
    
    init(name: String, home: String, away: String, valueType: String, homeValue: Int, awayValue: Int, homeTotal: Int?, awayTotal: Int?) {
        self.home = home
        self.away = away
        self.homeValue = homeValue
        self.awayValue = awayValue
        self.homeTotal = homeTotal
        self.awayTotal = awayTotal
        
        let valueTypeOptional = ValueType(rawValue: valueType)
        let nameOptional = NameStatisticsItemType(rawValue: name)
        
        self.valueType = valueTypeOptional ?? .unknown
        self.name = nameOptional ?? .unknown
    }

}
