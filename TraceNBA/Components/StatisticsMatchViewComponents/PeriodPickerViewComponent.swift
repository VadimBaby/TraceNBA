//
//  PeriodPickerViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 09.11.2023.
//

import SwiftUI

struct PeriodPickerViewComponent: View {
    
    @Binding var pickerSelection: PeriodType
    let statistics: [StatisticsMatchModel]
    
    var body: some View {
        Picker(selection: $pickerSelection) {
            ForEach(statistics, id: \.period) { statistic in
                Text(statistic.period.rawValue)
                    .tag(statistic.period)
            }
        } label: {
            Text(pickerSelection.rawValue)
                .font(.headline)
        }
        .tint(Color.white)
    }
}
