//
//  TeamModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct TeamModel: Identifiable {
    let id: Int
    let name: String
    let nameCode: String
    let manager: ManagerModel?
}
