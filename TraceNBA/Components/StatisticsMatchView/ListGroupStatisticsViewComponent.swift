//
//  ListGroupStatisticsViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import SwiftUI

struct ListGroupStatisticsViewComponent<Content: View>: View {
    
    let statistics: [StatisticsMatchModel]
    let groupName: GroupNameType
    let pickerSelection: PeriodType
    let circle: (_ value: Int, _ total: Int?) -> Content
    
    init(statistics: [StatisticsMatchModel], groupName: GroupNameType, pickerSelection: PeriodType, @ViewBuilder circle: @escaping (_: Int, _: Int?) -> Content) {
        self.statistics = statistics
        self.pickerSelection = pickerSelection
        self.circle = circle
        self.groupName = groupName
    }
    
    var body: some View {
        ForEach(getGroupStatisticsItems(
            statistics: statistics,
            groupName: groupName,
            period: pickerSelection
        ), id: \.name.rawValue) { statistic in
            StatisticsItemViewComponent(statistic: statistic, circle: circle)
        }
    }
    
    private func getGroupStatisticsItems(statistics: [StatisticsMatchModel], groupName: GroupNameType ,period: PeriodType) -> [StatisticsItemModel] {
        guard let statistic = statistics.first(where: { $0.period == period }) else { return [] }
        
        let groups = statistic.groups
        
        guard let scoreGroup = groups.first(where: { $0.groupName == groupName }) else { return [] }
        
        return scoreGroup.statisticsItems
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        ScrollView{
            VStack {
                ListGroupStatisticsViewComponent(statistics: FakeData.fakeStatisticsMatches, groupName: .scoring, pickerSelection: .all) { value, total in
                    if let total {
                        ProgressCircleViewComponent(value: value, total: total)
                    } else {
                        Text("Total is nil")
                    }
                }
                
                ListGroupStatisticsViewComponent(statistics: FakeData.fakeStatisticsMatches, groupName: .other, pickerSelection: .all) { value, total in
                    NumberCircleViewComponent(value: value)
                }
            }
            .padding()
        }
    }
}
