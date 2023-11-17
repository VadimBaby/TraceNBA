//
//  PickerTypeEntityPlayerViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

struct PickerTypeEntityPlayerViewComponent: View {
    @Binding public var showTypeEntityPlayer: TypeEntityPlayer
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TypeEntityPlayer.allCases, id: \.self) { item in
                getPickerItem(
                    text: item.rawValue,
                    typeView: item,
                    pickerView: $showTypeEntityPlayer
                )
            }
        }
        .font(.callout)
    }
}

extension PickerTypeEntityPlayerViewComponent {
    @ViewBuilder func getPickerItem(
        text: String,
        typeView: TypeEntityPlayer,
        pickerView: Binding<TypeEntityPlayer>
    ) -> some View {
        VStack(spacing: 0) {
            VStack {
                Text(text.uppercased())
                    .multilineTextAlignment(.center)
            }
            .frame(height: 50, alignment: .center)
            
            Rectangle()
                .frame(height: 3)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(showTypeEntityPlayer == typeView ? Color.white : Color.black)
        .onTapGesture {
            showTypeEntityPlayer = typeView
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        PickerTypeEntityPlayerViewComponent(showTypeEntityPlayer: .constant(.statistics))
    }
}
