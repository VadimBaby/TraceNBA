//
//  TypeTopTableItem.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import Foundation

enum TypeTopTableItem: String {
    case min = "MIN"
    case pts = "PTS"
    case reb = "REB"
    case ast = "AST"
    
    var parameter: String {
        switch self {
        case .min:
            return "secondsPlayed"
        case .pts:
            return "points"
        case .reb:
            return "rebounds"
        case .ast:
            return "assists"
        }
    }
    
    func getResultFromStatistic(statistic: PlayerStatisticsModel) -> String? {
        guard let result = statistic.getStatisticFromString(string: self.parameter) else { return nil }
        
        if self.parameter == "secondsPlayed" {
            return result.secondsToMinutesString()
        } else {
            return String(result)
        }
    }
}
