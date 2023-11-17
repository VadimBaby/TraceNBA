//
//  TypeEntityPlayer.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import Foundation

enum TypeEntityPlayer: String {
    case statistics
    case nearMatches = "near matches"
    case transferHistory = "transfer history"
    case highlights
    
    var title: String {
        return self.rawValue.uppercased()
    }
}
