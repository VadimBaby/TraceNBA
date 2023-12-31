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
    
    func getPlayerNearMatches(id: Int, isRefresh: Bool) async throws -> Data
    
    func getPlayerTransferHistory(id: Int, isRefresh: Bool) async throws -> Data
    
    func getPlayerMedia(id: Int, isRefresh: Bool) async throws -> Data
    
    func getTeamDetails(id: Int, isRefresh: Bool) async throws -> Data
    
    func getTeamNearMatches(id: Int, isRefresh: Bool) async throws -> Data 
    
    func getTeamPlayers(id: Int, isRefresh: Bool) async throws -> Data
    
    func getTeamMedia(id: Int, isRefresh: Bool) async throws -> Data
    
    func search(search: String, isRefresh: Bool) async throws -> Data
    
    func setLastRequestIntervalAsDate() async
}
