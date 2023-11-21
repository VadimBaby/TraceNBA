//
//  ChangingDateViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import SwiftUI

struct ChangingDateViewComponent: View {
    
    @ObservedObject public var viewModel: EventsViewModel
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        return formatter
    }
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "chevron.compact.left")
                .onTapGesture {
                    viewModel.minusDayToDateSchedule()
                }
            
            Text(formatter.string(from: viewModel.dateSchedule))
                .frame(width: 200, alignment: .center)
            
            Image(systemName: "chevron.compact.right")
                .onTapGesture {
                    viewModel.addDayToDateSchedule()
                }
        }
        .font(.system(.title2, design: .rounded, weight: .medium))
        .foregroundStyle(Color.white)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        ChangingDateViewComponent(viewModel: EventsViewModel(dataService: DataService()))
    }
}
