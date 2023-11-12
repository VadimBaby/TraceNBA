//
//  LineupsPlayerTableViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

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
        .frame(height: 40)
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

#Preview {
    ZStack {
        GradientComponent()
        
        LineupsPlayerTableViewComponent(players: Constants.fakeLineupsMatch.home.players)
    }
}
