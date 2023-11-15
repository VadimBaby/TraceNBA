//
//  IncidentType.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 15.11.2023.
//

import Foundation

enum IncidentType: String, Codable {
    case goal
    case period
    case unknown = "Unknown NameStatisticsItemType"
}
