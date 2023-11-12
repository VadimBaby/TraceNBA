//
//  HighlightModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import Foundation

struct HighlightModel: Codable, Identifiable {
    let title: String
    let subtitle: String
    let url: String
    let thumbnailUrl: String
    let id: Int
    let createdAtTimestamp: Int
    let sourceUrl: String
}
