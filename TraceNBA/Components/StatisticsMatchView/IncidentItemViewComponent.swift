//
//  IncidentItemViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 15.11.2023.
//

import SwiftUI

struct IncidentItemViewComponent: View {
    
    let incident: IncidentModel
    let matchModel: MatchModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        if let player = incident.player,
           let incidentClass = incident.incidentClass,
           incident.incidentType == .goal {
            HStack(spacing: 40) {
                NavigationLink(destination: { Text("Player profile") }, label: { getPlayerView(player: player)
                })
                
                VStack {
                    if let points = incidentClass.point {
                        Text("Scored: ^[\(points) point](inflect: true)")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    
                    matchView
                }
            }
            .foregroundStyle(Color.white)
        }
    }
    
    @ViewBuilder private func getPlayerView(player: PlayerModel) -> some View {
        VStack {
            ImageViewComponent(
                id: player.id,
                typeEntiy: .player,
                imageScale: 95,
                colorProgressView: Color.white,
                dataService: dataService
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            HStack {
                Text(player.shortName)
                    .font(.headline)
                if let isHome = incident.isHome {
                    ImageViewComponent(
                        id: isHome ? matchModel.homeTeam.id : matchModel.awayTeam.id,
                        typeEntiy: .team,
                        imageScale: 25,
                        colorProgressView: Color.white,
                        dataService: dataService
                    )
                }
            }
        }
    }
    
    @ViewBuilder private var matchView: some View {
        let imageScale: CGFloat = 50
        
        HStack {
            ImageViewComponent(
                id: matchModel.homeTeam.id,
                typeEntiy: .team,
                imageScale: imageScale,
                colorProgressView: Color.white,
                dataService: dataService
            )
            
            Text("\(incident.homeScore) : \(incident.awayScore)")
                .font(.headline)
            
            ImageViewComponent(
                id: matchModel.awayTeam.id,
                typeEntiy: .team,
                imageScale: imageScale,
                colorProgressView: Color.white,
                dataService: dataService
            )
        }
    }
}

#Preview {
    NavigationStack {
        ZStack {
            GradientComponent()
            
            IncidentItemViewComponent(
                incident: FakeData.fakeMatchIncidents.first!,
                matchModel: FakeData.fakeListLiveMatches.first!,
                dataService: MockDataService<DataModel>())
        }
    }
}
