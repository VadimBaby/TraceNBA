//
//  LineupsDataModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import Foundation

struct LineupsDataModel: Codable {
    let confirmed: Bool
    let home: LineupsItemModel
    let away: LineupsItemModel
}
