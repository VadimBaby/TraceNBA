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
    
    var point: Int? {
        switch self {
        case .onePoint:
            return 1
        case .twoPoints:
            return 2
        case .threePoints:
            return 3
        default:
            return nil
        }
    }
}
