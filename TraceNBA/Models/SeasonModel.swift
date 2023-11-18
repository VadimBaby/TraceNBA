//
//  SeasonModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 18.11.2023.
//

import Foundation

struct SeasonModel: Codable, Identifiable {
    let id: Int
    let name: String
    let editor: Bool
    let year: String
}
