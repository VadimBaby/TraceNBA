//
//  Errors.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

enum Errors: Error, Codable {
    case apiKeySetIsEmpty
    case listIsEmpty
    case badImage
    case badDate
    case cannotRefresh
    case dataIsNil
}
