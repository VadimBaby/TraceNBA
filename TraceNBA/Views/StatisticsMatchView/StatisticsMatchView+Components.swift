//
//  StatisticsMatchView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 10.11.2023.
//

import SwiftUI

extension StatisticsMatchView {
    @ViewBuilder func getTeamComparisonComponent(statistics: [StatisticsMatchModel]) -> some View {
        HStack(alignment: .bottom) {
            Text("Team comparison")
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            PeriodPickerViewComponent(
                pickerSelection: $pickerSelection,
                statistics: statistics
            )
        }
        .foregroundStyle(Color.white)
    }
    
    @ViewBuilder func getScoreStatisticItemView(statisticsItem: StatisticsItemModel, totalHome: Int, totalAway: Int) -> some View {
        HStack {
            ProgressCircleViewComponent(
                value: statisticsItem.homeValue,
                total: totalHome
            )
            
            Text(statisticsItem.name.rawValue)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.white)
                .font(.title2)
            
            ProgressCircleViewComponent(
                value: statisticsItem.awayValue,
                total: totalAway
            )
        }
        .padding(.vertical)
    }
    
    @ViewBuilder var progressView: some View {
        ProgressView()
            .tint(Color.white)
    }
}
