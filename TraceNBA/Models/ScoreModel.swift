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
    
    init(current: Int, display: Int, period1: Int) {
        self.current = current
        self.display = display
        self.period1 = period1
        self.period2 = nil
        self.period3 = nil
        self.period4 = nil
    }
    
    init(current: Int, display: Int, period1: Int, period2: Int?) {
        self.current = current
        self.display = display
        self.period1 = period1
        self.period2 = period2
        self.period3 = nil
        self.period4 = nil
    }
    
    init(current: Int, display: Int, period1: Int, period2: Int?, period3: Int?) {
        self.current = current
        self.display = display
        self.period1 = period1
        self.period2 = period2
        self.period3 = period3
        self.period4 = nil
    }
    
    init(current: Int, display: Int, period1: Int, period2: Int?, period3: Int?, period4: Int?) {
        self.current = current
        self.display = display
        self.period1 = period1
        self.period2 = period2
        self.period3 = period3
        self.period4 = period4
    }
}
