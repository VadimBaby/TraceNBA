//
//  PlayerStatisticsView+Toolbar.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 14.11.2023.
//

import Foundation
import SwiftUI

extension PlayerStatisticsView {
    @ViewBuilder var backButton: some View {
        Button(action: { dismiss() }, label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .foregroundStyle(toolBarColor)
        })
    }
    
    @ViewBuilder var matchScore: some View {
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
                    .foregroundStyle(toolBarColor)
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
