//
//  ScoreModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct ScoreModel: Codable {
    let current: Int?
    let display: Int?
    let period1: Int?
    let period2: Int?
    let period3: Int?
    let period4: Int?
    let overtime: Int?
    
    init(current: Int? = nil, display: Int? = nil, period1: Int? = nil, period2: Int? = nil, period3: Int? = nil, period4: Int? = nil, overtime: Int? = nil) {
        self.current = current
        self.display = display
        self.period1 = period1
        self.period2 = period2
        self.period3 = period3
        self.period4 = period4
        self.overtime = overtime
    }
}
