//
//  DataServiceProtocol.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import SwiftUI

protocol DataServiceProtocol {
    func getLiveMatchesData() async throws -> Data
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> UIImage
    
    func getScheduleMatchesData(dateSchedule: Date, isRefresh: Bool) async throws -> Data
}
