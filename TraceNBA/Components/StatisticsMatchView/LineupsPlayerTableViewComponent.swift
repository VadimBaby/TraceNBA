//
//  LineupsPlayerTableViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

struct LineupsPlayerTableViewComponent: View {
    
    let players: [LineupsItemPlayerModel]
    let matchModel: MatchModel
    let teamPlayers: TeamModel
    
    @Binding var sortedParameter: TypeTopTableItem
    @Binding var isAscending: Bool
    
    let dataService: DataServiceProtocol
    
    private let topItems: [TypeTopTableItem] = [.min, .pts, .reb, .ast]
    
    var body: some View {
        ScrollView {
            VStack {
                getTopLineupsPlayerTableItem(topItems: topItems)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
                
                VStack(spacing: 10) {
                    ForEach(sortedPlayers(players: players), id: \.player.id) { player in
                        
                        NavigationLink {
                            PlayerStatisticsView(
                                lineupsPlayer: player, 
                                matchModel: matchModel, 
                                teamPlayer: teamPlayers,
                                dataService: dataService
                            )
                        } label: {
                            getLineupsPlayerTableItem(player: player, topItems: topItems)
                        }

                    }
                }
                
                plugRectangle
            }
            .padding()
        }
        .font(.headline)
        .foregroundStyle(Color.white)
    }
    
    private func sortedPlayers(players: [LineupsItemPlayerModel]) -> [LineupsItemPlayerModel] {
        return players.sorted { first, second in
            let firstResult: Int? = first.statistics.getStatisticFromString(string: sortedParameter.parameter)
            
            let secondResult: Int? = second.statistics.getStatisticFromString(string: sortedParameter.parameter)
            
            guard let firstResult, let secondResult else {
                return first.statistics.assists > second.statistics.assists
            }
            
            let result: Bool = firstResult > secondResult
            
            return isAscending ? result : !result
        }
    }
}

extension LineupsPlayerTableViewComponent {
    @ViewBuilder func getLineupsPlayerTableItem(player: LineupsItemPlayerModel, topItems: [TypeTopTableItem]) -> some View {
        HStack {
            Text(player.player.shortName)
                .frame(width: 100, alignment: .leading)
            
            ForEach(topItems, id: \.self) { topItem in
                if let result = topItem.getResultFromStatistic(statistic: player.statistics) {
                    Text("\(result)")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .frame(height: 40)
    }
    
    @ViewBuilder func getTopLineupsPlayerTableItem(topItems: [TypeTopTableItem]) -> some View {
        HStack {
            Text("PLAYER")
                .frame(width: 100, alignment: .leading)
            
            ForEach(topItems, id: \.self) { item in
                HStack(spacing: 3) {
                    Text(item.rawValue)
                    
                    if sortedParameter == item {
                        Image(systemName: isAscending ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        if sortedParameter == item {
                            isAscending.toggle()
                        } else {
                            sortedParameter = item
                            isAscending = true
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder private var plugRectangle: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 100)
    }
}

#Preview {
    NavigationStack {
        ZStack {
            GradientComponent()
            
            LineupsPlayerTableViewComponent(
                players: FakeData.fakeLineupsMatch.home.players, 
                matchModel: FakeData.fakeListLiveMatches.first!, 
                teamPlayers: FakeData.fakeListLiveMatches.first!.homeTeam,
                sortedParameter: .constant(.ast),
                isAscending: .constant(true), 
                dataService: MockDataService<DataModel>()
            )
        }
    }
}
