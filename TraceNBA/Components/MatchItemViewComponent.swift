//
//  MatchItemViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 03.11.2023.
//

import SwiftUI

struct MatchItemViewComponent: View {
    
    let matchModel: MatchModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        content
            .frame(height: 105)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thickMaterial)
            )
            .padding(.horizontal)
    }
}

extension MatchItemViewComponent {
    @ViewBuilder private var content: some View {
        VStack {
            HStack {
                MatchItemImageComponent(
                    id: matchModel.homeTeam.id,
                    dataService: dataService
                )
                
                Spacer()
                
                scoreContent
                
                Spacer()
                
                MatchItemImageComponent(
                    id: matchModel.awayTeam.id,
                    dataService: dataService
                )
            }
            
            getStartDate(startTimestamp: matchModel.startTimestamp)
        }
    }
    
    @ViewBuilder private var scoreContent: some View {
        VStack {
            HStack {
                getViewScoreTeam(
                    team: matchModel.homeTeam.shortName,
                    score: matchModel.homeScore
                )
                
                Text(":")
                    .font(.largeTitle)
                
                getViewScoreTeam(
                    team: matchModel.awayTeam.shortName,
                    score: matchModel.awayScore
                )
            }
        }
    }
    
    @ViewBuilder func getStartDate(startTimestamp: Int) -> some View {
        let date: Date = Date(timeIntervalSince1970: TimeInterval(startTimestamp))
        
        let nowDate: Date = Date()
        
        var formatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mma, MMM d"
            
            return formatter
        }
        
        let stringData = formatter.string(from: date)
        
        let start: String = nowDate > date ? "Started" : "Start"
        
        Text("\(start) at \(stringData)")
            .font(.callout)
    }
    
    @ViewBuilder func getViewScoreTeam(team: String, score: ScoreModel?) -> some View {
        
        var display: String {
            if let score,
               let display = score.display {
                return "\(display)"
            }
            
            return "-"
        }
        
        VStack(alignment: .center) {
            Text(team)
                .font(.subheadline)
            Text("\(display)")
                .font(.largeTitle)
        }
        .frame(minWidth: 60, maxWidth: 70)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        MatchItemViewComponent(
            matchModel: MatchModel(
                id: 11548663,
                tournament: nil,
                homeTeam: TeamModel(
                    id: 3428,
                    name: "Golden State Warriors", 
                    shortName: "Warrios",
                    nameCode: "GSW"),
                awayTeam: TeamModel(
                    id: 3413,
                    name: "Sacramento Kings", 
                    shortName: "Kings",
                    nameCode: "SAC"),
                homeScore: ScoreModel(
                    current: 103,
                    display: 103,
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
            ), dataService: DataService())
    }
}

