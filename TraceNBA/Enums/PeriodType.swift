//
//  PeriodType.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 07.11.2023.
//

import Foundation

enum PeriodType: String, Codable {
    case all = "ALL"
    case quarter1 = "1Q"
    case quarter2 = "2Q"
    case quarter3 = "3Q"
    case quarter4 = "4Q"
    case overtime1 = "OT1"
    case overtime2 = "OT2"
    case overtime3 = "OT3"
    case overtime4 = "OT4"
    case unknown = "Unknown PeriodType"
}
