//
//  DataModel.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation

struct DataModel: Codable {
    let events: [MatchModel]?
    let players: [PlayerDataModel]?
    let statistics: [StatisticsMatchModel]?
    let highlights: [HighlightModel]?
    let incidents: [IncidentModel]?
    let uniqueTournamentSeasons: [UniqueTournamentSeasonsItem]?
    let previousEvent: MatchModel?
    let nextEvent: MatchModel?
    let transferHistory: [TransferModel]?
    let media: [HighlightModel]?
    let message: String?
    
    init(
        events: [MatchModel]? = nil,
        players: [PlayerDataModel]? = nil,
        statistics: [StatisticsMatchModel]? = nil,
        highlights: [HighlightModel]? = nil,
        incidents: [IncidentModel]? = nil,
        uniqueTournamentSeasons: [UniqueTournamentSeasonsItem]? = nil,
        previousEvent: MatchModel? = nil,
        nextEvent: MatchModel? = nil,
        transferHistory: [TransferModel]? = nil,
        media: [HighlightModel]? = nil,
        message: String? = nil
    ) {
        self.events = events
        self.players = players
        self.statistics = statistics
        self.highlights = highlights
        self.incidents = incidents
        self.uniqueTournamentSeasons = uniqueTournamentSeasons
        self.previousEvent = previousEvent
        self.nextEvent = nextEvent
        self.transferHistory = transferHistory
        self.media = media
        self.message = message
    }
}
