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
    
    func getYearsOld() -> String? {
        let date: Date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let nowDate: Date = Date()
        
        let yearDateComponents = Calendar.current.dateComponents([.year], from: date, to: nowDate)
        
        guard let year = yearDateComponents.year else { return nil}
        
        return String(year)
    }
}
