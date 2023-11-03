//
//  MatchViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import SwiftUI

struct MatchViewComponent: View {
    
    let matchModel: MatchModel
    
    let imageScale: CGFloat = 70
    
    var body: some View {
        content
            .frame(height: 75)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thickMaterial)
            )
            .padding(.horizontal)
    }
}

extension MatchViewComponent {
    @ViewBuilder private var content: some View {
        HStack {
            Circle()
                .frame(width: imageScale, height: imageScale)
            
            Spacer()
            
            scoreContent
            
            Spacer()
            
            Circle()
                .frame(width: imageScale, height: imageScale)
        }
    }
    
    @ViewBuilder private var scoreContent: some View {
        VStack {
            HStack {
                getViewScoreTeam(team: "Warrios", score: 120)
                
                Text(":")
                    .font(.largeTitle)
                
                getViewScoreTeam(team: "Grizzlies", score: 120)
            }
        }
    }
    
    @ViewBuilder func getViewScoreTeam(team: String, score: Int) -> some View {
        VStack(alignment: .center) {
            Text(team)
                .font(.subheadline)
            Text("\(score)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        MatchViewComponent(
            matchModel: MatchModel(
                id: 11548663,
                homeTeam: TeamModel(
                    id: 3428,
                    name: "Golden State Warriors",
                    nameCode: "GSW"),
                awayTeam: TeamModel(
                    id: 3413,
                    name: "Sacramento Kings",
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
        ))
    }
}
