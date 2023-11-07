//
//  MockDataService.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import Foundation
import SwiftUI

actor MockDataService<AnyData: Codable>: DataServiceProtocol {
    
    let anyData: AnyData?
    
    init(data: AnyData? = nil) {
        anyData = data
    }
    
    func getLiveMatchesData(isRefresh: Bool) async throws -> Data {
        if isRefresh {
            throw Errors.cannotRefresh
        }
        
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel: DataModel = DataModel(events: self.listLiveMatches)
            
            let data = try JSONEncoder().encode(dataModel)
            
            return data
        }
    }
    
    func getScheduleMatchesData(dateSchedule: Date, isRefresh: Bool) async throws -> Data {
        if isRefresh {
            throw Errors.cannotRefresh
        }
        
        if let data = anyData {
            let dataEncode = try JSONEncoder().encode(data)
            
            return dataEncode
        } else {
            let dataModel: DataModel = DataModel(events: self.listLiveMatches)
            
            let data = try JSONEncoder().encode(dataModel)
            
            return data
        }
    }
    
    func getPhotoEntity(entity: TypeEntity, id: Int) async throws -> UIImage {
        
        let managers: [String] = ["manager1", "manager2"]
        let teams: [String] = ["team1", "team2"]
        let players: [String] = ["player1", "player2"]
        
        if let data = anyData, let imageData = data as? UIImage {
            return imageData
        } else {
            switch entity {
            case .team:
                return try encodeRandomImageFromList(list: teams)
            case .player:
                return try encodeRandomImageFromList(list: players)
            case .manager:
                return try encodeRandomImageFromList(list: managers)
            }
        }
    }
    
    private func encodeRandomImageFromList(list: [String]) throws -> UIImage {
        guard let randomNameImage = list.randomElement() else { throw Errors.listIsEmpty }
        
        guard let uiImage = UIImage(named: randomNameImage) else { throw Errors.badImage }
        
        return uiImage
    }
}

// listLiveMatches

extension MockDataService {
    var listLiveMatches: [MatchModel] {
        return [
            MatchModel(
                id: 11548663,
                tournament: nil,
                homeTeam: TeamModel(
                    id: 3428,
                    name: "Golden State Warriors",
                    shortName: "Warriors",
                    nameCode: "GSW"),
                awayTeam: TeamModel(
                    id: 3413,
                    name: "Sacramento Kings",
                    shortName: "Kings",
                    nameCode: "SAC"),
                homeScore: ScoreModel(
                    current: 86,
                    display: 86,
                    period1: 28,
                    period2: 28,
                    period3: 18,
                    period4: 12
                ),
                awayScore: ScoreModel(
                    current: 85,
                    display: 85,
                    period1: 31,
                    period2: 31,
                    period3: 24,
                    period4: 6
                ),
                startTimestamp: 1698890400
            ),
            MatchModel(
                id: 11548667,
                tournament: TournamentModel(uniqueTournament: UniqueTournamentModel(name: "NBA", slug: "nba", id: 132)),
                homeTeam: TeamModel(
                    id: 3427,
                    name: "Los Angeles Lakers",
                    shortName: "Lakers",
                    nameCode: "LAL"),
                awayTeam: TeamModel(
                    id: 3425,
                    name: "Los Angeles Clippers",
                    shortName: "Clippers",
                    nameCode: "LAC"),
                homeScore: ScoreModel(
                    current: 81,
                    display: 81,
                    period1: 24,
                    period2: 24,
                    period3: 33
                ),
                awayScore: ScoreModel(
                    current: 82,
                    display: 82,
                    period1: 37,
                    period2: 24,
                    period3: 21
                ),
                startTimestamp: 1698890400
            )
        ]
    }
}


// statisticsMatches

extension MockDataService {
    var statisticsMatches: [StatisticsMatchModel] {
        return [
            StatisticsMatchModel(
                period: "ALL",
                groups: [
                    GroupModel(
                        groupName: "Scoring",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Free throws",
                                home: "13/15 (86%)",
                                away: "18/23 (78%)",
                                valueType: "team",
                                homeValue: 13,
                                awayValue: 18,
                                homeTotal: 15,
                                awayTotal: 23
                            ),
                            StatisticsItemModel(
                                name: "2 pointers",
                                home: "28/50 (56%)",
                                away: "25/53 (47%)",
                                valueType: "team",
                                homeValue: 28,
                                awayValue: 25,
                                homeTotal: 50,
                                awayTotal: 53
                            ),
                            StatisticsItemModel(
                                name: "3 pointers",
                                home: "11/31 (35%)",
                                away: "11/35 (31%)",
                                valueType: "team",
                                homeValue: 11,
                                awayValue: 11,
                                homeTotal: 31,
                                awayTotal: 35
                            ),
                            StatisticsItemModel(
                                name: "Field goals",
                                home: "39/81 (48%)",
                                away: "36/88 (40%)",
                                valueType: "team",
                                homeValue: 39,
                                awayValue: 36,
                                homeTotal: 81,
                                awayTotal: 88
                            )
                        ]),
                    GroupModel(
                        groupName: "Other",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Rebounds",
                                home: "36",
                                away: "48",
                                valueType: "event",
                                homeValue: 36,
                                awayValue: 48
                            ),
                            StatisticsItemModel(
                                name: "Defensive rebounds",
                                home: "29",
                                away: "34",
                                valueType: "event",
                                homeValue: 29,
                                awayValue: 34
                            ),
                            StatisticsItemModel(
                                name: "Offensive rebounds",
                                home: "7",
                                away: "14",
                                valueType: "event",
                                homeValue: 7,
                                awayValue: 14
                            ),
                            StatisticsItemModel(
                                name: "Assists",
                                home: "32",
                                away: "24",
                                valueType: "event",
                                homeValue: 32,
                                awayValue: 24
                            ),
                            StatisticsItemModel(
                                name: "Turnovers",
                                home: "17",
                                away: "12",
                                valueType: "event",
                                homeValue: 17,
                                awayValue: 12
                            ),
                            StatisticsItemModel(
                                name: "Steals",
                                home: "5",
                                away: "8",
                                valueType: "event",
                                homeValue: 5,
                                awayValue: 8
                            ),
                            StatisticsItemModel(
                                name: "Blocks",
                                home: "6",
                                away: "4",
                                valueType: "event",
                                homeValue: 6,
                                awayValue: 4
                            ),
                            StatisticsItemModel(
                                name: "Fouls",
                                home: "17",
                                away: "17",
                                valueType: "event",
                                homeValue: 17,
                                awayValue: 17
                            )
                        ]),
                    GroupModel(
                        groupName: "Lead",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Max points in a row",
                                home: "8",
                                away: "10",
                                valueType: "event",
                                homeValue: 8,
                                awayValue: 10
                            ),
                            StatisticsItemModel(
                                name: "Time spent in lead",
                                home: "19:26",
                                away: "23:58",
                                valueType: "time",
                                homeValue: 1166,
                                awayValue: 1438,
                                homeTotal: 2880,
                                awayTotal: 2880
                            ),
                            StatisticsItemModel(
                                name: "Biggest lead",
                                home: "9",
                                away: "11",
                                valueType: "event",
                                homeValue: 9,
                                awayValue: 11
                            )
                        ]
                    )
                ]),
            StatisticsMatchModel(
                period: "1Q",
                groups: [
                    GroupModel(
                        groupName: "Scoring",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Free throws",
                                home: "3/4 (75%)",
                                away: "7/9 (77%)",
                                valueType: "team",
                                homeValue: 3,
                                awayValue: 7,
                                homeTotal: 4,
                                awayTotal: 9
                            ),
                            StatisticsItemModel(
                                name: "2 pointers",
                                home: "8/11 (72%)",
                                away: "6/10 (60%)",
                                valueType: "team",
                                homeValue: 8,
                                awayValue: 6,
                                homeTotal: 11,
                                awayTotal: 10
                            ),
                            StatisticsItemModel(
                                name: "3 pointers",
                                home: "3/11 (27%)",
                                away: "4/7 (57%)",
                                valueType: "team",
                                homeValue: 3,
                                awayValue: 4,
                                homeTotal: 11,
                                awayTotal: 7
                            ),
                            StatisticsItemModel(
                                name: "Field goals",
                                home: "11/22 (50%)",
                                away: "10/17 (58%)",
                                valueType: "team",
                                homeValue: 11,
                                awayValue: 10,
                                homeTotal: 22,
                                awayTotal: 17
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Other",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Rebounds",
                                home: "6",
                                away: "11",
                                valueType: "event",
                                homeValue: 6,
                                awayValue: 11
                            ),
                            StatisticsItemModel(
                                name: "Defensive rebounds",
                                home: "6",
                                away: "11",
                                valueType: "event",
                                homeValue: 6,
                                awayValue: 11
                            ),
                            StatisticsItemModel(
                                name: "Offensive rebounds",
                                home: "0",
                                away: "0",
                                valueType: "event",
                                homeValue: 0,
                                awayValue: 0
                            ),
                            StatisticsItemModel(
                                name: "Assists",
                                home: "8",
                                away: "6",
                                valueType: "event",
                                homeValue: 8,
                                awayValue: 6
                            ),
                            StatisticsItemModel(
                                name: "Turnovers",
                                home: "2",
                                away: "5",
                                valueType: "event",
                                homeValue: 2,
                                awayValue: 5
                            ),
                            StatisticsItemModel(
                                name: "Steals",
                                home: "2",
                                away: "2",
                                valueType: "event",
                                homeValue: 2,
                                awayValue: 2
                            ),
                            StatisticsItemModel(
                                name: "Blocks",
                                home: "0",
                                away: "1",
                                valueType: "event",
                                homeValue: 0,
                                awayValue: 1
                            ),
                            StatisticsItemModel(
                                name: "Fouls",
                                home: "5",
                                away: "3",
                                valueType: "event",
                                homeValue: 5,
                                awayValue: 3
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Lead",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Time spent in lead",
                                home: "11:04",
                                away: "0:02",
                                valueType: "time",
                                homeValue: 664,
                                awayValue: 2,
                                homeTotal: 720,
                                awayTotal: 720
                            ),
                            StatisticsItemModel(
                                name: "Biggest lead",
                                home: "9",
                                away: "3",
                                valueType: "event",
                                homeValue: 9,
                                awayValue: 3
                            )
                        ]
                    )
                ]
            ),
            StatisticsMatchModel(
                period: "2Q",
                groups: [
                    GroupModel(
                        groupName: "Scoring",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Free throws",
                                home: "3/4 (75%)",
                                away: "3/4 (75%)",
                                valueType: "team",
                                homeValue: 3,
                                awayValue: 3,
                                homeTotal: 4,
                                awayTotal: 4
                            ),
                            StatisticsItemModel(
                                name: "2 pointers",
                                home: "8/13 (61%)",
                                away: "6/11 (54%)",
                                valueType: "team",
                                homeValue: 8,
                                awayValue: 6,
                                homeTotal: 13,
                                awayTotal: 11
                            ),
                            StatisticsItemModel(
                                name: "3 pointers",
                                home: "3/6 (50%)",
                                away: "3/13 (23%)",
                                valueType: "team",
                                homeValue: 3,
                                awayValue: 3,
                                homeTotal: 6,
                                awayTotal: 13
                            ),
                            StatisticsItemModel(
                                name: "Field goals",
                                home: "11/19 (57%)",
                                away: "9/24 (37%)",
                                valueType: "team",
                                homeValue: 11,
                                awayValue: 9,
                                homeTotal: 19,
                                awayTotal: 24
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Other",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Rebounds",
                                home: "10",
                                away: "11",
                                valueType: "event",
                                homeValue: 10,
                                awayValue: 11
                            ),
                            StatisticsItemModel(
                                name: "Defensive rebounds",
                                home: "9",
                                away: "7",
                                valueType: "event",
                                homeValue: 9,
                                awayValue: 7
                            ),
                            StatisticsItemModel(
                                name: "Offensive rebounds",
                                home: "1",
                                away: "4",
                                valueType: "event",
                                homeValue: 1,
                                awayValue: 4
                            ),
                            StatisticsItemModel(
                                name: "Assists",
                                home: "10",
                                away: "7",
                                valueType: "event",
                                homeValue: 10,
                                awayValue: 7
                            ),
                            StatisticsItemModel(
                                name: "Turnovers",
                                home: "6",
                                away: "3",
                                valueType: "event",
                                homeValue: 6,
                                awayValue: 3
                            ),
                            StatisticsItemModel(
                                name: "Steals",
                                home: "1",
                                away: "4",
                                valueType: "event",
                                homeValue: 1,
                                awayValue: 4
                            ),
                            StatisticsItemModel(
                                name: "Blocks",
                                home: "0",
                                away: "0",
                                valueType: "event",
                                homeValue: 0,
                                awayValue: 0
                            ),
                            StatisticsItemModel(
                                name: "Fouls",
                                home: "5",
                                away: "5",
                                valueType: "event",
                                homeValue: 5,
                                awayValue: 5
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Lead",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Time spent in lead",
                                home: "3:49",
                                away: "7:06",
                                valueType: "time",
                                homeValue: 229,
                                awayValue: 426,
                                homeTotal: 720,
                                awayTotal: 720
                            ),
                            StatisticsItemModel(
                                name: "Biggest lead",
                                home: "4",
                                away: "6",
                                valueType: "event",
                                homeValue: 4,
                                awayValue: 6
                            )
                        ]
                    )
                ]
            ),
            StatisticsMatchModel(
                period: "3Q",
                groups: [
                    GroupModel(
                        groupName: "Scoring",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Free throws",
                                home: "3/3 (100%)",
                                away: "0/0 (0%)",
                                valueType: "team",
                                homeValue: 3,
                                awayValue: 0,
                                homeTotal: 3,
                                awayTotal: 0
                            ),
                            StatisticsItemModel(
                                name: "2 pointers",
                                home: "3/13 (23%)",
                                away: "6/15 (40%)",
                                valueType: "team",
                                homeValue: 3,
                                awayValue: 6,
                                homeTotal: 13,
                                awayTotal: 15
                            ),
                            StatisticsItemModel(
                                name: "3 pointers",
                                home: "3/7 (42%)",
                                away: "4/11 (36%)",
                                valueType: "team",
                                homeValue: 3,
                                awayValue: 4,
                                homeTotal: 7,
                                awayTotal: 11
                            ),
                            StatisticsItemModel(
                                name: "Field goals",
                                home: "6/20 (30%)",
                                away: "10/26 (38%)",
                                valueType: "team",
                                homeValue: 6,
                                awayValue: 10,
                                homeTotal: 20,
                                awayTotal: 26
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Other",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Rebounds",
                                home: "9",
                                away: "17",
                                valueType: "event",
                                homeValue: 9,
                                awayValue: 17
                            ),
                            StatisticsItemModel(
                                name: "Defensive rebounds",
                                home: "7",
                                away: "12",
                                valueType: "event",
                                homeValue: 7,
                                awayValue: 12
                            ),
                            StatisticsItemModel(
                                name: "Offensive rebounds",
                                home: "2",
                                away: "5",
                                valueType: "event",
                                homeValue: 2,
                                awayValue: 5
                            ),
                            StatisticsItemModel(
                                name: "Assists",
                                home: "5",
                                away: "4",
                                valueType: "event",
                                homeValue: 5,
                                awayValue: 4
                            ),
                            StatisticsItemModel(
                                name: "Turnovers",
                                home: "4",
                                away: "3",
                                valueType: "event",
                                homeValue: 4,
                                awayValue: 3
                            ),
                            StatisticsItemModel(
                                name: "Steals",
                                home: "1",
                                away: "0",
                                valueType: "event",
                                homeValue: 1,
                                awayValue: 0
                            ),
                            StatisticsItemModel(
                                name: "Blocks",
                                home: "0",
                                away: "3",
                                valueType: "event",
                                homeValue: 0,
                                awayValue: 3
                            ),
                            StatisticsItemModel(
                                name: "Fouls",
                                home: "0",
                                away: "5",
                                valueType: "event",
                                homeValue: 0,
                                awayValue: 5
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Lead",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Time spent in lead",
                                home: "0:19",
                                away: "11:21",
                                valueType: "time",
                                homeValue: 19,
                                awayValue: 681,
                                homeTotal: 720,
                                awayTotal: 720
                            ),
                            StatisticsItemModel(
                                name: "Biggest lead",
                                home: "1",
                                away: "11",
                                valueType: "event",
                                homeValue: 1,
                                awayValue: 11
                            )
                        ]
                    )
                ]
            ),
            StatisticsMatchModel(
                period: "4Q",
                groups: [
                    GroupModel(
                        groupName: "Scoring",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Free throws",
                                home: "4/4 (100%)",
                                away: "8/10 (80%)",
                                valueType: "team",
                                homeValue: 4,
                                awayValue: 8,
                                homeTotal: 4,
                                awayTotal: 10
                            ),
                            StatisticsItemModel(
                                name: "2 pointers",
                                home: "9/13 (69%)",
                                away: "7/17 (41%)",
                                valueType: "team",
                                homeValue: 9,
                                awayValue: 7,
                                homeTotal: 13,
                                awayTotal: 17
                            ),
                            StatisticsItemModel(
                                name: "3 pointers",
                                home: "2/7 (28%)",
                                away: "0/4 (0%)",
                                valueType: "team",
                                homeValue: 2,
                                awayValue: 0,
                                homeTotal: 7,
                                awayTotal: 4
                            ),
                            StatisticsItemModel(
                                name: "Field goals",
                                home: "11/20 (55%)",
                                away: "7/21 (33%)",
                                valueType: "team",
                                homeValue: 11,
                                awayValue: 7,
                                homeTotal: 20,
                                awayTotal: 21
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Other",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Rebounds",
                                home: "11",
                                away: "9",
                                valueType: "event",
                                homeValue: 11,
                                awayValue: 9
                            ),
                            StatisticsItemModel(
                                name: "Defensive rebounds",
                                home: "7",
                                away: "4",
                                valueType: "event",
                                homeValue: 7,
                                awayValue: 4
                            ),
                            StatisticsItemModel(
                                name: "Offensive rebounds",
                                home: "4",
                                away: "5",
                                valueType: "event",
                                homeValue: 4,
                                awayValue: 5
                            ),
                            StatisticsItemModel(
                                name: "Assists",
                                home: "9",
                                away: "7",
                                valueType: "event",
                                homeValue: 9,
                                awayValue: 7
                            ),
                            StatisticsItemModel(
                                name: "Turnovers",
                                home: "5",
                                away: "1",
                                valueType: "event",
                                homeValue: 5,
                                awayValue: 1
                            ),
                            StatisticsItemModel(
                                name: "Steals",
                                home: "1",
                                away: "2",
                                valueType: "event",
                                homeValue: 1,
                                awayValue: 2
                            ),
                            StatisticsItemModel(
                                name: "Blocks",
                                home: "6",
                                away: "0",
                                valueType: "event",
                                homeValue: 6,
                                awayValue: 0
                            ),
                            StatisticsItemModel(
                                name: "Fouls",
                                home: "7",
                                away: "4",
                                valueType: "event",
                                homeValue: 7,
                                awayValue: 4
                            )
                        ]
                    ),
                    GroupModel(
                        groupName: "Lead",
                        statisticsItems: [
                            StatisticsItemModel(
                                name: "Time spent in lead",
                                home: "4:13",
                                away: "5:29",
                                valueType: "time",
                                homeValue: 253,
                                awayValue: 329,
                                homeTotal: 720,
                                awayTotal: 720
                            ),
                            StatisticsItemModel(
                                name: "Biggest lead",
                                home: "3",
                                away: "5",
                                valueType: "event",
                                homeValue: 3,
                                awayValue: 5
                            )
                        ]
                    )
                ]
            )
        ]
    }
}
