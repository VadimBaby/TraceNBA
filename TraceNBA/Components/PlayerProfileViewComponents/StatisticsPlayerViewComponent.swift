//
//  StatisticsPlayerViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 19.11.2023.
//

import SwiftUI

struct StatisticsPlayerViewComponent: View {
    
    let statistics: PlayerStatisticsModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                getStatisticsItem(
                    name: "Points",
                    value: statistics.points
                )
                
                getTimeStatistics(
                    name: "Seconds played",
                    value: statistics.secondsPlayed
                )
                
                getStatisticsItem(
                    name: "Free throws",
                    value: statistics.freeThrowsMade,
                    total: statistics.freeThrowAttempts
                )
                
                getStatisticsItem(
                    name: "2 pointers",
                    value: statistics.twoPointsMade,
                    total: statistics.twoPointAttempts
                )
                
                getStatisticsItem(
                    name: "3 pointers",
                    value: statistics.threePointsMade,
                    total: statistics.threePointAttempts
                )
                
                getStatisticsItem(
                    name: "Field goals",
                    value: statistics.fieldGoalsMade,
                    total: statistics.fieldGoalAttempts
                )
                
                getStatisticsItem(
                    name: "Rebounds",
                    value: statistics.rebounds
                )
                
                getStatisticsItem(
                    name: "Defensive ebounds",
                    value: statistics.defensiveRebounds
                )
                
                getStatisticsItem(
                    name: "Offensive Rebounds",
                    value: statistics.offensiveRebounds
                )
                
                getStatisticsItem(
                    name: "Assists",
                    value: statistics.assists
                )
                
                getStatisticsItem(
                    name: "Turnovers",
                    value: statistics.turnovers
                )
                
                getStatisticsItem(
                    name: "Steals",
                    value: statistics.steals
                )
                
                getStatisticsItem(
                    name: "Blocks",
                    value: statistics.blocks
                )
                
                getStatisticsItem(
                    name: "Personal foulds",
                    value: statistics.personalFouls
                )
                
                if let doubleDoubles = statistics.doubleDoubles {
                    getStatisticsItem(
                        name: "Double doubles",
                        value: doubleDoubles
                    )
                }
                
                if let tripleDoubles = statistics.tripleDoubles {
                    getStatisticsItem(
                        name: "Triple doubles",
                        value: tripleDoubles
                    )
                }
                
                PlugRectangleViewComponent()
            }
            .padding()
        }
    }
}

extension StatisticsPlayerViewComponent {
    @ViewBuilder public func getStatisticsItem(name: String, value: Int, total: Int? = nil) -> some View {
        HStack {
            Text(name)
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let total {
                ProgressCircleViewComponent(value: value, total: total)
            } else {
                NumberCircleViewComponent(value: value)
            }
        }
    }
    
    @ViewBuilder public func getTimeStatistics(name: String, value: Int) -> some View {
        HStack {
            Text(name)
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(value)")
                .foregroundStyle(Color.white)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        StatisticsPlayerViewComponent(
            statistics: FakeData.fakePlayerStatistics
        )
    }
}
