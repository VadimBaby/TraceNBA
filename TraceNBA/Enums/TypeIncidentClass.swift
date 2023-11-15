//
//  TypeIncidentClass.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 15.11.2023.
//

import Foundation

enum TypeIncidentClass: String, Codable {
    case onePoint
    case twoPoints
    case threePoints
    case unknown = "Unknown NameStatisticsItemType"
}
