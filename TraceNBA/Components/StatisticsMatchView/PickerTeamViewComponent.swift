//
//  PickerTeamViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

struct PickerTeamViewComponent: View {
    
    @Binding var showTeam: TypeShowTeam
    @Binding var showTeamAnimated: TypeShowTeam
    
    let nameHomeTeam: String
    let nameAwayTeam: String
    
    @Namespace private var namespace
    
    private let gradient: LinearGradient = LinearGradient(
        colors: [Color.blue, Color.purple],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    var body: some View {
        HStack {
            Text(nameHomeTeam)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background {
                    if showTeamAnimated == .homeTeam {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(gradient)
                            .matchedGeometryEffect(id: "backgroundPickerTeam", in: namespace)
                    }
                }
                .onTapGesture {
                    showTeam = .homeTeam
                    
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showTeamAnimated = .homeTeam
                    }
                }
            
            Text(nameAwayTeam)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background {
                    if showTeamAnimated == .awayTeam {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(gradient)
                            .matchedGeometryEffect(id: "backgroundPickerTeam", in: namespace)
                    }
                }
                .onTapGesture {
                    showTeam = .awayTeam
                    
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showTeamAnimated = .awayTeam
                    }
                }
        }
        .foregroundStyle(Color.white)
        .font(.title2)
        .fontWeight(.medium)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(.ultraThinMaterial)
        )
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        PickerTeamViewComponent(
            showTeam: .constant(.homeTeam), 
            showTeamAnimated: .constant(.homeTeam), 
            nameHomeTeam: "Lakers",
            nameAwayTeam: "Warrios"
        )
        .padding()
    }
}
