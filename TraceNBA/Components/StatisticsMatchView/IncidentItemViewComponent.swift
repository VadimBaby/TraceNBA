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
            HStack {
                ImageViewComponent(
                    id: player.id,
                    typeEntiy: .player,
                    imageScale: 95,
                    colorProgressView: Color.white,
                    dataService: dataService
                )
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Spacer()
                
                VStack {
                    if let points = incidentClass.point {
                        Text("Scored: \(points) point")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    
                    matchView
                }
                .foregroundStyle(Color.white)
            }
        }
    }
    
    private var matchView: some View {
        var imageScale: CGFloat = 50
        
        return HStack {
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
    ZStack {
        GradientComponent()
        
        IncidentItemViewComponent(
            incident: FakeData.fakeMatchIncidents.first!,
            matchModel: FakeData.fakeListLiveMatches.first!,
            dataService: MockDataService<DataModel>())
    }
}
