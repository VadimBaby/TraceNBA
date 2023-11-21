//
//  MatchViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import SwiftUI

struct MatchViewComponent: View {
    
    let match: MatchModel
    let homeScore: ScoreModel
    let awayScore: ScoreModel
    let dataService: DataServiceProtocol
    
    private let imageScale: CGFloat = 80
    
    var body: some View {
        content
            .padding()
    }
}

extension MatchViewComponent {
    @ViewBuilder private var content: some View {
        HStack(spacing: 30) {
            getTeamLogo(
                id: match.homeTeam.id,
                shortName: match.homeTeam.shortName,
                nameCode: match.homeTeam.nameCode
            )
            
            if let currentHome = homeScore.current,
               let currentAway = awayScore.current {
                getScore(
                    currentHome: currentHome,
                    currentAway: currentAway
                )
            }
            
            getTeamLogo(
                id: match.awayTeam.id,
                shortName: match.awayTeam.shortName,
                nameCode: match.awayTeam.nameCode
            )
        }
    }
    
    @ViewBuilder private func getScore(currentHome: Int, currentAway: Int) -> some View {
        Text("\(currentHome) : \(currentAway)")
            .font(.system(size: 30, weight: .regular, design: .rounded))
            .foregroundStyle(Color.white)
    }
    
    @ViewBuilder private func getTeamLogo(id: Int, shortName: String, nameCode: String) -> some View {
        
        var teamTitle: String {
            return shortName.count > 6 ? nameCode : shortName
        }
        
        VStack {
            ImageViewComponent(
                id: id,
                typeEntiy: .team,
                imageScale: imageScale,
                dataService: dataService
            )
            
            Text(teamTitle)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
        }
        .frame(width: 80)

    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        MatchViewComponent(match: MatchModel(
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
        dataService: MockDataService<DataModel>())
    }
}

