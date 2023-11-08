//
//  PickerStatisticsViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import SwiftUI

struct PickerStatisticsViewComponent: View {
    
    @Binding public var showBoxScore: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            getPickerItem(text: "Summary")
                .foregroundStyle(showBoxScore ? Color.black : Color.white)
                .onTapGesture {
                    withAnimation(.linear(duration: 0.2)) {
                        showBoxScore = false
                    }
                }
            
            getPickerItem(text: "Box Score")
                .foregroundStyle(showBoxScore ? Color.white : Color.black)
                .onTapGesture {
                    withAnimation(.linear(duration: 0.2)) {
                        showBoxScore = true
                    }
                }
        }
        .font(.title2)
    }
}

extension PickerStatisticsViewComponent {
    @ViewBuilder func getPickerItem(text: String) -> some View {
        VStack(spacing: 5) {
            Text(text.uppercased())
            Rectangle()
                .frame(height: 3)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        PickerStatisticsViewComponent(showBoxScore: .constant(false))
    }
}
