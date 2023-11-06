//
//  ValueType.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 07.11.2023.
//

import Foundation

enum ValueType: String, Codable {
    case team
    case event
    case time
    case unknown = "Unknown ValueType"
}
