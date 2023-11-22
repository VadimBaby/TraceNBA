//
//  TypeEntity.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 03.11.2023.
//

import Foundation

enum TypeEntity: String {
    case team
    case player
    case manager
    
    func getUrlString(id: Int) -> String {
        switch self {
        case .team:
            return "https://basketapi1.p.rapidapi.com/api/basketball/team/\(id)/image"
        case .player:
            return "https://basketapi1.p.rapidapi.com/api/basketball/player/\(id)/image"
        case .manager:
            return "https://basketapi1.p.rapidapi.com/api/basketball/manager/\(id)/image"
        }
    }
}
