//
//  NoDateMessage.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import Foundation

enum NoDataMessage: String {
    case noLiveMatches = "Unfortunately, none of the teams aren't playing now"
    case noScheduleMatches = "Unfortunately, there is no match schedule for this day"
    case noStatisticsMatch = "Unfortunately, the statistics of this match are not available yet"
    case noMatchLineups = "Unfortunately, the lineups of this match are not available yet"
    case noMatchHighlights = "Unfortunately, the highlights of this match are not available yet"
    case noMatchIncidents = "Unfortunately, the incidents of this match are not available yet"
    case noPlayerDetails = "Unfortunately, the profile of player is not available"
    case noPlayerSeasons = "Unfortunately, the seasons of player is not available"
    case noPlayerStatisticsRegularSeason = "Unfortunately, the statistics of this season is not available"
    case noPlayerNearMatches = "Unfortunately, the near matches of this player is not available"
    case noPlayerTransferHistory = "Unfortunately, the transfer history of this player is not available"
    case noPlayerMedia = "Unfortunately, the media of this player are not available"
    case noTeamDetails = "Unfortunately, the details of this team are not available"
    case noTeamPlayers = "Unfortunately, the players of this team are not available"
    case noTeamMedia = "Unfortunately, the media of this team are not available"
    case noSearchResults = "There's nothing here"
}
