//
//  Int.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import Foundation

extension Int {
    func secondsToMinutesString() -> String {
        let minutes = self / 60
        let seconds = self % 60
        
        return "\(minutes):\(seconds > 9 ? String(seconds) : "0" + String(seconds))"
    }
}
