//
//  PickerTypeEntityTeamViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

struct PickerTypeEntityTeamViewComponent: View {
    @Binding public var showTypeEntityTeam: TypeEntityTeam
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TypeEntityTeam.allCases, id: \.self) { item in
                getPickerItem(
                    text: item.rawValue,
                    typeView: item,
                    pickerView: $showTypeEntityTeam
                )
            }
        }
        .font(.callout)
    }
}

extension PickerTypeEntityTeamViewComponent {
    @ViewBuilder func getPickerItem(
        text: String,
        typeView: TypeEntityTeam,
        pickerView: Binding<TypeEntityTeam>
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
        .foregroundStyle(showTypeEntityTeam == typeView ? Color.white : Color.black)
        .onTapGesture {
            showTypeEntityTeam = typeView
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        PickerTypeEntityTeamViewComponent(showTypeEntityTeam: .constant(.nearMatches))
    }
}
