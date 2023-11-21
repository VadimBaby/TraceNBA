//
//  TypeEntityTeam.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import Foundation

enum TypeEntityTeam: String, CaseIterable {
    case nearMatches = "near matches"
    case transfers
    case media
    
    var title: String {
        return self.rawValue.uppercased()
    }
}
