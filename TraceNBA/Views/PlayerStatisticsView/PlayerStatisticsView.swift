//
//  PlayerStatisticsView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 13.11.2023.
//

import SwiftUI

struct PlayerStatisticsView: View {
    
    let lineupsPlayer: LineupsItemPlayerModel
    let matchModel: MatchModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        ZStack {
            GradientComponent()
            
            ScrollView {
                VStack {
                    PlugRectangleViewComponent()
                    
                    ImageViewComponent(
                        id: lineupsPlayer.player.id,
                        typeEntiy: .player,
                        imageScale: 160,
                        colorProgressView: Color.white,
                        dataService: dataService
                    )
                    .tint(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Text(lineupsPlayer.player.name)
                        .foregroundStyle(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    if let yearString = countYearsOldFormDateBirth(dataBirth: lineupsPlayer.player.dateOfBirthTimestamp) {
                        Text(yearString + " years")
                            .foregroundStyle(Color(uiColor: UIColor.lightText))
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    
                    NavigationLink(destination: { Text("Profile") }) { profileText }
                    
                    VStack {
                        Text("Points scored: \(lineupsPlayer.statistics.points)")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Time played: \(lineupsPlayer.statistics.secondsPlayed.secondsToMinutesString()) minutes")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    
                    getPlayerStatistics(playerStatistics: lineupsPlayer.statistics)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    ImageViewComponent(
                        id: matchModel.homeTeam.id,
                        typeEntiy: .team,
                        imageScale: 30,
                        dataService: dataService
                    )
                    
                    if let homeScore = matchModel.homeScore?.current,
                       let awayScore = matchModel.awayScore?.current {
                        Text("\(homeScore) : \(awayScore)")
                    }
                    
                    ImageViewComponent(
                        id: matchModel.awayTeam.id,
                        typeEntiy: .team,
                        imageScale: 30,
                        dataService: dataService
                    )
                }
            }
        }
    }
    
    private func countYearsOldFormDateBirth(dataBirth: Int) -> String? {
        let date: Date = Date(timeIntervalSince1970: TimeInterval(dataBirth))
        
        let nowDate: Date = Date()
        
        let yearDateComponents = Calendar.current.dateComponents([.year], from: date, to: nowDate)
        
        guard let year = yearDateComponents.year else { return nil}
        
        return String(year)
    }
}

#Preview {
    NavigationStack {
        PlayerStatisticsView(
            lineupsPlayer: FakeData.fakeLineupsMatch.home.players.first!, 
            matchModel: FakeData.fakeListLiveMatches.first!,
            dataService: MockDataService<DataModel>()
        )
    }
}
