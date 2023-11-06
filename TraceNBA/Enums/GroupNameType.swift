//
//  GroupNameType.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 07.11.2023.
//

import Foundation

enum GroupNameType: String, Codable {
    case scoring = "Scoring"
    case other = "Other"
    case lead = "Lead"
    case unknown = "Unknown GroupNameType"
}
