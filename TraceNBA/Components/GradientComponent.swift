//
//  GradientComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import SwiftUI

struct GradientComponent: View {
    
    let firstGradientColor: Color = Color("FirstGradientColor")
    let secondGradientColor: Color = Color("SecondGradientColor")
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [firstGradientColor, secondGradientColor]), startPoint: .leading, endPoint: .trailing)
            .ignoresSafeArea()
    }
}

#Preview {
    GradientComponent()
}
