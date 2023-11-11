//
//  StatisticsItemViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import SwiftUI

struct StatisticsItemViewComponent<Content: View>: View {
    
    let statistic: StatisticsItemModel
    let circle: (_ value: Int, _ total: Int?) -> Content
    
    init(statistic: StatisticsItemModel, @ViewBuilder circle: @escaping (_ value: Int, _ total: Int?) -> Content) {
        self.statistic = statistic
        self.circle = circle
    }
    
    var body: some View {
        HStack {
            circle(statistic.homeValue, statistic.homeTotal)
            
            Text(statistic.name.rawValue)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.white)
                .font(.title2)
                .multilineTextAlignment(.center)
            
            circle(statistic.awayValue, statistic.awayTotal)
        }
        .padding(.vertical)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        StatisticsItemViewComponent(statistic: StatisticsItemModel(
            name: "3 pointers",
            home: "3/7 (42%)",
            away: "4/11 (36%)",
            valueType: "team",
            homeValue: 3,
            awayValue: 4,
            homeTotal: 7,
            awayTotal: 11
        )) { value, total in
            if let total {
                ProgressCircleViewComponent(value: value, total: total)
            } else {
                Text("total is nil")
            }
        }
        .padding()
    }
}
