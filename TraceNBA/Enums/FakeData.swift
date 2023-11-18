//
//  FakeData.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import Foundation

enum FakeData {
    static let fakeListLiveMatches: [MatchModel] = [
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
    
    static let fakeStatisticsMatches: [StatisticsMatchModel] = [
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
    
    static let fakeLineupsMatch: LineupsDataModel = LineupsDataModel(
        confirmed: true,
        home: LineupsItemModel(
            players: [
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 817442,
                        name: "Andrew Wiggins",
                        firstName: "Andrew",
                        lastName: "Wiggins ",
                        shortName: "A. Wiggins",
                        position: "F",
                        country: CountryModel(name: "Canada", alpha2: "CA"),
                        dateOfBirthTimestamp: 793497600
                    ),
                    shirtNumber: 22,
                    jerseyNumber: "22",
                    position: "F",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 1518,
                        points: 14,
                        twoPointsMade: 6,
                        twoPointAttempts: 9,
                        threePointsMade: 0,
                        threePointAttempts: 1,
                        freeThrowsMade: 2,
                        freeThrowAttempts: 2,
                        fieldGoalsMade: 6,
                        fieldGoalAttempts: 10,
                        rebounds: 2,
                        defensiveRebounds: 2,
                        offensiveRebounds: 0,
                        turnovers: 1,
                        blocks: 0,
                        personalFouls: 2,
                        assists: 0,
                        steals: 0,
                        plusMinus: -50,
                        fieldGoalPct: 60
                    )
                ),
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 817050,
                        name: "Stephen Curry",
                        firstName: "Stephen",
                        lastName: "Curry ",
                        shortName: "S. Curry",
                        position: "G",
                        country: CountryModel(name: "USA", alpha2: "US"),
                        dateOfBirthTimestamp: 574300800
                    ),
                    shirtNumber: 30,
                    jerseyNumber: "30",
                    position: "G",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 1939,
                        points: 21,
                        twoPointsMade: 3,
                        twoPointAttempts: 5,
                        threePointsMade: 4,
                        threePointAttempts: 10,
                        freeThrowsMade: 3,
                        freeThrowAttempts: 3,
                        fieldGoalsMade: 7,
                        fieldGoalAttempts: 15,
                        rebounds: 5,
                        defensiveRebounds: 4,
                        offensiveRebounds: 1,
                        turnovers: 7,
                        blocks: 0,
                        personalFouls: 3,
                        assists: 3,
                        steals: 0,
                        plusMinus: -6,
                        fieldGoalPct: 47
                    )
                ),
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 1132126,
                        name: "Jonathan Kuminga",
                        firstName: "Jonathan",
                        lastName: "Kuminga ",
                        shortName: "J. Kuminga",
                        position: "F",
                        country: CountryModel(name: "USA", alpha2: "US"),
                        dateOfBirthTimestamp: 1033862400
                    ),
                    shirtNumber: 0,
                    jerseyNumber: "0",
                    position: "F",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 1027,
                        points: 12,
                        twoPointsMade: 3,
                        twoPointAttempts: 7,
                        threePointsMade: 1,
                        threePointAttempts: 2,
                        freeThrowsMade: 3,
                        freeThrowAttempts: 3,
                        fieldGoalsMade: 4,
                        fieldGoalAttempts: 9,
                        rebounds: 1,
                        defensiveRebounds: 1,
                        offensiveRebounds: 0,
                        turnovers: 0,
                        blocks: 0,
                        personalFouls: 2,
                        assists: 1,
                        steals: 1,
                        plusMinus: 3,
                        fieldGoalPct: 44
                    )
                ),
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 817122,
                        name: "Draymond Green",
                        firstName: "Draymond",
                        lastName: "Green ",
                        shortName: "D. Green",
                        position: "F",
                        country: CountryModel(name: "USA", alpha2: "US"),
                        dateOfBirthTimestamp: 636508800
                    ),
                    shirtNumber: 23,
                    jerseyNumber: "23",
                    position: "F",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 1650,
                        points: 13,
                        twoPointsMade: 2,
                        twoPointAttempts: 3,
                        threePointsMade: 2,
                        threePointAttempts: 4,
                        freeThrowsMade: 3,
                        freeThrowAttempts: 5,
                        fieldGoalsMade: 4,
                        fieldGoalAttempts: 7,
                        rebounds: 2,
                        defensiveRebounds: 0,
                        offensiveRebounds: 2,
                        turnovers: 2,
                        blocks: 2,
                        personalFouls: 1,
                        assists: 9,
                        steals: 2,
                        plusMinus: -5,
                        fieldGoalPct: 57
                    )
                )
            ],
            missingPlayers: []
        ),
        away: LineupsItemModel(
            players: [
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 885258,
                        name: "Malik Monk",
                        firstName: "Malik",
                        lastName: "Monk ",
                        shortName: "M. Monk",
                        position: "G",
                        country: CountryModel(name: "USA", alpha2: "US"),
                        dateOfBirthTimestamp: 886550400
                    ),
                    shirtNumber: 0,
                    jerseyNumber: "0",
                    position: "G",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 1478,
                        points: 16,
                        twoPointsMade: 2,
                        twoPointAttempts: 4,
                        threePointsMade: 3,
                        threePointAttempts: 5,
                        freeThrowsMade: 3,
                        freeThrowAttempts: 3,
                        fieldGoalsMade: 5,
                        fieldGoalAttempts: 9,
                        rebounds: 3,
                        defensiveRebounds: 0,
                        offensiveRebounds: 3,
                        turnovers: 3,
                        blocks: 2,
                        personalFouls: 1,
                        assists: 2,
                        steals: 0,
                        plusMinus: 1,
                        fieldGoalPct: 56
                    )
                ),
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 885258,
                        name: "Sasha Vezenkov",
                        firstName: "",
                        lastName: "",
                        shortName: "S. Vezenkov",
                        position: "F",
                        country: CountryModel(name: "Bulgaria", alpha2: "BG"),
                        dateOfBirthTimestamp: 807667200
                    ),
                    shirtNumber: 7,
                    jerseyNumber: "7",
                    position: "F",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 1046,
                        points: 2,
                        twoPointsMade: 1,
                        twoPointAttempts: 3,
                        threePointsMade: 0,
                        threePointAttempts: 3,
                        freeThrowsMade: 0,
                        freeThrowAttempts: 0,
                        fieldGoalsMade: 1,
                        fieldGoalAttempts: 6,
                        rebounds: 5,
                        defensiveRebounds: 5,
                        offensiveRebounds: 0,
                        turnovers: 1,
                        blocks: 0,
                        personalFouls: 2,
                        assists: 0,
                        steals: 0,
                        plusMinus: -3,
                        fieldGoalPct: 17
                    )
                ),
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 816977,
                        name: "Harrison Barnes",
                        firstName: "Harrison",
                        lastName: "Barnes ",
                        shortName: "H. Barnes",
                        position: "F",
                        country: CountryModel(name: "USA", alpha2: "US"),
                        dateOfBirthTimestamp: 707184000
                    ),
                    shirtNumber: 40,
                    jerseyNumber: "40",
                    position: "F",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 1834,
                        points: 14,
                        twoPointsMade: 0,
                        twoPointAttempts: 1,
                        threePointsMade: 4,
                        threePointAttempts: 7,
                        freeThrowsMade: 2,
                        freeThrowAttempts: 2,
                        fieldGoalsMade: 4,
                        fieldGoalAttempts: 8,
                        rebounds: 1,
                        defensiveRebounds: 0,
                        offensiveRebounds: 1,
                        turnovers: 1,
                        blocks: 0,
                        personalFouls: 0,
                        assists: 1,
                        steals: 1,
                        plusMinus: 2,
                        fieldGoalPct: 50
                    )
                ),
                LineupsItemPlayerModel(
                    player: PlayerModel(
                        id: 846968,
                        name: "Domantas Sabonis",
                        firstName: "Domantas",
                        lastName: "Sabonis ",
                        shortName: "D. Sabonis",
                        position: "FC",
                        country: CountryModel(name: "Lithuania", alpha2: "LT"),
                        dateOfBirthTimestamp: 831081600
                    ),
                    shirtNumber: 10,
                    jerseyNumber: "10",
                    position: "FC",
                    statistics: PlayerStatisticsModel(
                        secondsPlayed: 2225,
                        points: 23,
                        twoPointsMade: 8,
                        twoPointAttempts: 15,
                        threePointsMade: 0,
                        threePointAttempts: 1,
                        freeThrowsMade: 7,
                        freeThrowAttempts: 12,
                        fieldGoalsMade: 8,
                        fieldGoalAttempts: 16,
                        rebounds: 11,
                        defensiveRebounds: 8,
                        offensiveRebounds: 3,
                        turnovers: 2,
                        blocks: 0,
                        personalFouls: 2,
                        assists: 8,
                        steals: 0,
                        plusMinus: -4,
                        fieldGoalPct: 50
                    )
                )
            ],
            missingPlayers: [
                LineupsItemMissingPlayerModel(
                    player: PlayerModel(
                        id: 885244,
                        name: "De'Aaron Fox",
                        firstName: "De'Aaron",
                        lastName: "Fox ",
                        shortName: "D. Fox",
                        position: "G",
                        country: CountryModel(name: "USA", alpha2: "US"),
                        dateOfBirthTimestamp: 882576000
                    ),
                    type: "missing",
                    reason: 1
                ),
                LineupsItemMissingPlayerModel(
                    player: PlayerModel(
                        id: 817240,
                        name: "Trey Lyles",
                        firstName: "Trey",
                        lastName: "Lyles ",
                        shortName: "T. Lyles",
                        position: "F",
                        country: CountryModel(name: "Canada", alpha2: "CA"),
                        dateOfBirthTimestamp: 815529600
                    ),
                    type: "missing",
                    reason: 1
                )
            ]
        )
    )
    
    static let fakeMatchHighlights: [HighlightModel] = [
        HighlightModel(
            title: "Golden State Warriors 102-101 Sacramento Kings",
            subtitle: "Full Highlights",
            url: "https://youtu.be/tzc5sx3T1E4",
            thumbnailUrl: "https://i.ytimg.com/vi/tzc5sx3T1E4/maxresdefault.jpg",
            id: 5114811,
            createdAtTimestamp: 1698909350,
            sourceUrl: "https://youtu.be/tzc5sx3T1E4"
        ),
        HighlightModel(
            title: "Golden State Warriors 102-101 Sacramento Kings",
            subtitle: "Short Highlights",
            url: "https://youtu.be/McnBZHnE6aE",
            thumbnailUrl: "https://i.ytimg.com/vi/McnBZHnE6aE/maxresdefault.jpg",
            id: 5114809,
            createdAtTimestamp: 1698909303,
            sourceUrl: "https://youtu.be/McnBZHnE6aE"
        ),
        HighlightModel(
            title: "Golden State Warriors 102-101 Sacramento Kings",
            subtitle: "Final Ending",
            url: "https://www.youtube.com/watch?v=Bavb-cbSgXE",
            thumbnailUrl: "https://img.youtube.com/vi/Bavb-cbSgXE/hqdefault.jpg",
            id: 5114815,
            createdAtTimestamp: 1698909568,
            sourceUrl: "https://www.youtube.com/watch?v=Bavb-cbSgXE"
        )
    ]
    
    static let fakeMatchIncidents: [IncidentModel] = [
        IncidentModel(
            homeScore: 115,
            awayScore: 108,
            player: PlayerModel(
                id: 817177,
                name: "Kyrie Irving",
                firstName: "Kyrie",
                lastName: "Irving ",
                shortName: "K. Irving",
                position: "G"
            ),
            id: 160448468,
            time: 48,
            isHome: true,
            incidentClass: "onePoint",
            reversedPeriodTime: 1,
            incidentType: "goal"
        ),
        IncidentModel(
            homeScore: 114,
            awayScore: 108,
            player: PlayerModel(
                id: 817177,
                name: "Kyrie Irving",
                firstName: "Kyrie",
                lastName: "Irving ",
                shortName: "K. Irving",
                position: "G"
            ),
            id: 160448464,
            time: 48,
            isHome: true,
            incidentClass: "onePoint",
            reversedPeriodTime: 1,
            incidentType: "goal"
        ),
        IncidentModel(
            homeScore: 113,
            awayScore: 108,
            player: PlayerModel(
                id: 1133830,
                name: "Evan Mobley",
                firstName: "Evan",
                lastName: "Mobley ",
                shortName: "E. Mobley",
                position: "F"
            ),
            id: 160448447,
            time: 48,
            isHome: false,
            incidentClass: "twoPoints",
            reversedPeriodTime: 1,
            incidentType: "goal"
        ),
        IncidentModel(
            homeScore: 108,
            awayScore: 115,
            player: nil,
            id: nil,
            time: 48,
            isHome: nil,
            incidentClass: nil,
            reversedPeriodTime: 1,
            incidentType: "period"
        ),
        IncidentModel(
            homeScore: 111,
            awayScore: 106,
            player: PlayerModel(
                id: 817177,
                name: "Kyrie Irving",
                firstName: "Kyrie",
                lastName: "Irving ",
                shortName: "K. Irving",
                position: "G"
            ),
            id: 160448418,
            time: 48,
            isHome: true,
            incidentClass: "threePoint",
            reversedPeriodTime: 1,
            incidentType: "goal"
        )
    ]
    
    static let fakePlayerDetails: PlayerModel = PlayerModel(
        id: 846936,
        name: "Caris LeVert",
        firstName: "Caris",
        lastName: "LeVert ",
        shortName: "C. LeVert",
        position: "G",
        country: CountryModel(
            name: "USA",
            alpha2: "US"
        ),
        jerseyNumber: "3",
        height: 198,
        dateOfBirthTimestamp: 777772800,
        team: TeamModel(
            id: 3432,
            name: "Cleveland Cavaliers",
            shortName: "Cavaliers",
            nameCode: "CLE"
        )
    )
    
    static let fakePlayerSeasons: [UniqueTournamentSeasonsItem] = [
        UniqueTournamentSeasonsItem(
            uniqueTournament: UniqueTournamentModel(
                name: "NBA",
                slug: "nba",
                id: 132
            ),
            seasons: [
                SeasonModel(
                    id: 54105,
                    name: "NBA 23/24",
                    editor: false,
                    year: "23/24"
                ),
                SeasonModel(
                    id: 56094,
                    name: "NBA In-Season Tournament 2023",
                    editor: false,
                    year: "NBA In-Season Tournament 2023"
                ),
                SeasonModel(
                    id: 45096,
                    name: "NBA 22/23",
                    editor: false,
                    year: "22/23"
                ),
                SeasonModel(
                    id: 38191,
                    name: "NBA 21/22",
                    editor: false,
                    year: "21/22"
                ),
                SeasonModel(
                    id: 34951,
                    name: "NBA 20/21",
                    editor: false,
                    year: "20/21"
                )
            ]
        ),
        UniqueTournamentSeasonsItem(
            uniqueTournament: UniqueTournamentModel(
                name: "NBA Preseason",
                slug: "nba-preseason",
                id: 2329
            ),
            seasons: [
                SeasonModel(
                    id: 54640,
                    name: "NBA Preseason 2023",
                    editor: false,
                    year: "2023"
                ),
                SeasonModel(
                    id: 44744,
                    name: "NBA Preseason 22/23",
                    editor: false,
                    year: "22/23"
                )
            ]
        )
    ]
    
    static let fakePlayerStatistics: PlayerStatisticsModel = PlayerStatisticsModel(
        secondsPlayed: 139384,
        points: 1690,
        twoPointsMade: 589,
        twoPointAttempts: 873,
        threePointsMade: 57,
        threePointAttempts: 149,
        freeThrowsMade: 341,
        freeThrowAttempts: 415,
        fieldGoalsMade: 646,
        fieldGoalAttempts: 1022,
        rebounds: 817,
        defensiveRebounds: 650,
        offensiveRebounds: 167,
        turnovers: 247,
        blocks: 47,
        personalFouls: 174,
        assists: 678,
        steals: 87,
        plusMinus: 640,
        fieldGoalPct: nil,
        doubleDoubles: 58,
        tripleDoubles: 29,
        appearances: 69
    )
}
