//
//  PlayerStatisticsView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 13.11.2023.
//

import Foundation
import SwiftUI

extension PlayerStatisticsView {
    @ViewBuilder var profileText: some View {
        Text("Profile")
            .foregroundStyle(Constants.gradient)
            .font(.title2)
            .fontWeight(.medium)
            .frame(width: 200, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thickMaterial)
            )
    }
    
    @ViewBuilder func getPlayerStatisticItemCircle(title: String, value: Int, total: Int? = nil) -> some View {
        HStack {
            Text(title + ":")
                .foregroundStyle(Color.white)
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let total = total {
                ProgressCircleViewComponent(value: value, total: total)
            } else {
                NumberCircleViewComponent(value: value)
            }
        }
        .padding()
    }
    
    @ViewBuilder func getPlayerStatistics(playerStatistics: PlayerStatisticsModel) -> some View {
        let listStatisticsItem: [(title: String, value: Int, total: Int?)] = [
            (
                title: "Free throws",
                value: playerStatistics.freeThrowsMade,
                total: playerStatistics.freeThrowAttempts
            ),
            (
                title: "2 pointers",
                value: playerStatistics.twoPointsMade,
                total: playerStatistics.twoPointAttempts
            ),
            (
                title: "3 pointers",
                value: playerStatistics.threePointsMade,
                total: playerStatistics.threePointAttempts
            ),
            (
                title: "Field goals",
                value: playerStatistics.fieldGoalsMade,
                total: playerStatistics.fieldGoalAttempts
            ),
            (
                title: "Rebounds",
                value: playerStatistics.rebounds,
                total: nil
            ),
            (
                title: "Defensive rebounds",
                value: playerStatistics.defensiveRebounds,
                total: nil
            ),
            (
                title: "Offensive rebounds",
                value: playerStatistics.offensiveRebounds,
                total: nil
            ),
            (
                title: "Assists",
                value: playerStatistics.assists,
                total: nil
            ),
            (
                title: "Turnovers",
                value: playerStatistics.turnovers,
                total: nil
            ),
            (
                title: "Steals",
                value: playerStatistics.steals,
                total: nil
            ),
            (
                title: "Blocks",
                value: playerStatistics.blocks,
                total: nil
            )
            ,
            (
                title: "Fouls",
                value: playerStatistics.personalFouls,
                total: nil
            )
        ]
        
        ForEach(listStatisticsItem, id: \.title) { item in
            getPlayerStatisticItemCircle(
                title: item.title,
                value: item.value,
                total: item.total
            )
        }
    }
}
