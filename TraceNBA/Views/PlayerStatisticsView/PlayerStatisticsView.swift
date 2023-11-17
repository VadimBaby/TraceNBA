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
    
    @State public var toolBarColor: Color = Color.white
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .center) {
            GradientComponent()
            
            ScrollView {
                VStack {
                    PlugRectangleViewComponent()
                        .onScrollViewOffsetChanged { value in
                            withAnimation(.easeInOut) {
                                let color = value < 30 ? Color.black : Color.white
                                
                                toolBarColor = color
                            }
                        }
                    
                    playerImage
                    
                    Text(lineupsPlayer.player.name)
                        .foregroundStyle(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    if let dateOfBirthTimestamp = lineupsPlayer.player.dateOfBirthTimestamp,
                       let yearString = countYearsOldFormDateBirth(dataBirth: dateOfBirthTimestamp) {
                        Text(yearString + " years")
                            .foregroundStyle(Color(uiColor: UIColor.lightText))
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    
                    NavigationLink(destination: {
                        
                        PlayerProfileView(
                            idPlayer: lineupsPlayer.player.id,
                            dataService: dataService
                        )
                        
                    }) { profileText }
                    
                    VStack {
                        getTextStatistics(
                            text: "Points scored: \(lineupsPlayer.statistics.points)"
                        )
                    
                        getTextStatistics(
                            text: "Time played: \(lineupsPlayer.statistics.secondsPlayed.secondsToMinutesString()) minutes"
                        )
                    }
                    .padding()
                    
                    getPlayerStatistics(playerStatistics: lineupsPlayer.statistics)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) { backButton }
            ToolbarItem(placement: .principal) { matchScore }
        }
        .navigationBarBackButtonHidden(true)
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
