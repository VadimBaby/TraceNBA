//
//  DataServiceProtocol.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import SwiftUI

protocol DataServiceProtocol {
    func getLiveMatchesData(isRefresh: Bool) async throws -> Data
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> UIImage
    
    func getScheduleMatchesData(dateSchedule: Date, isRefresh: Bool) async throws -> Data
    
    func getStatisticsMatchData(id: Int, isRefresh: Bool) async throws -> Data
    
    func getMatchLineups(id: Int, isRefresh: Bool) async throws -> Data
    
    func getMatchHighlights(id: Int, isRefresh: Bool) async throws -> Data
    
    func getImageFromUrl(urlString: String) async throws -> Data
    
    func getMatchIncidents(id: Int, isRefresh: Bool) async throws -> Data
    
    func getPlayerDetails(id: Int, isRefresh: Bool) async throws -> Data
    
    func getPlayerSeasons(id: Int, isRefresh: Bool) async throws -> Data
    
    func getPlayerStatisticsRegularSeason(idPlayer: Int, idSeason: Int, isRefresh: Bool) async throws -> Data
}
