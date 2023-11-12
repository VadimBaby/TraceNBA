//
//  LineupsPlayerTableViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

enum TypeTopTableItem: String {
    case min = "MIN"
    case pts = "PTS"
    case reb = "REB"
    case ast = "AST"
    
    var parameter: String {
        switch self {
        case .min:
            return "secondsPlayed"
        case .pts:
            return "points"
        case .reb:
            return "rebounds"
        case .ast:
            return "assists"
        }
    }
    
    func getResultFromStatistic(statistic: PlayerStatisticsModel) -> String? {
        guard let result = statistic.getStatisticFromString(string: self.parameter) else { return nil }
        
        if self.parameter == "secondsPlayed" {
            return result.secondsToMinutesString()
        } else {
            return String(result)
        }
    }
}

struct LineupsPlayerTableViewComponent: View {
    
    let players: [LineupsItemPlayerModel]
    
    private let topItems: [TypeTopTableItem] = [.min, .pts, .reb, .ast]
    
    var body: some View {
        ScrollView {
            VStack {
                getTopLineupsPlayerTableItem(topItems: topItems)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
                
                VStack(spacing: 10) {
                    ForEach(players, id: \.player.id) { player in
                        getLineupsPlayerTableItem(player: player, topItems: topItems)
                    }
                }
            }
            .padding()
        }
        .font(.headline)
        .foregroundStyle(Color.white)
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
    }
    
    @ViewBuilder func getTopLineupsPlayerTableItem(topItems: [TypeTopTableItem]) -> some View {
        HStack {
            Text("PLAYER")
                .frame(width: 100, alignment: .leading)
            
            ForEach(topItems, id: \.self) { item in
                Text(item.rawValue)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

extension Int {
    func secondsToMinutesString() -> String {
        let minutes = self / 60
        let seconds = self % 60
        
        return "\(minutes):\(seconds > 9 ? String(seconds) : "0" + String(seconds))"
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        LineupsPlayerTableViewComponent(players: Constants.fakeLineupsMatch.home.players)
    }
}
