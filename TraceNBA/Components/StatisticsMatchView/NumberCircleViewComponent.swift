//
//  NumberCircleViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import SwiftUI

struct NumberCircleViewComponent: View {
    
    let number: Int
    
    var body: some View {
        Circle()
            .fill(.thickMaterial)
            .overlay {
                Text("\(number)")
                    .foregroundStyle(Constants.gradient)
                    .font(.largeTitle)
                    .fontWeight(.medium)
            }
            .frame(width: 90, height: 90)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        HStack {
            NumberCircleViewComponent(number: 5)
            
            Text("Steals")
                .font(.title2)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
            
            NumberCircleViewComponent(number: 7)
        }
        .padding()
    }
}
