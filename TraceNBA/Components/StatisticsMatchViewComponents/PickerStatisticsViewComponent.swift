//
//  PickerStatisticsViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import SwiftUI

struct PickerStatisticsViewComponent: View {
    
    @Binding public var showTypeStatisticsView: TypeStatisticsView
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TypeStatisticsView.allCases, id: \.self) { item in
                getPickerItem(
                    text: item.rawValue,
                    typeView: item,
                    pickerView: $showTypeStatisticsView
                )
            }
        }
        .font(.callout)
    }
}

extension PickerStatisticsViewComponent {
    @ViewBuilder func getPickerItem(
        text: String,
        typeView: TypeStatisticsView,
        pickerView: Binding<TypeStatisticsView>
    ) -> some View {
        VStack(spacing: 5) {
            Text(text.uppercased())
            Rectangle()
                .frame(height: 3)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(showTypeStatisticsView == typeView ? Color.white : Color.black)
        .onTapGesture {
            showTypeStatisticsView = typeView
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        PickerStatisticsViewComponent(showTypeStatisticsView: .constant(TypeStatisticsView.summary))
    }
}
