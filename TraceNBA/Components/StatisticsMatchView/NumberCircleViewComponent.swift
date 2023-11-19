//
//  NumberCircleViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 11.11.2023.
//

import SwiftUI

struct NumberCircleViewComponent: View {
    
    let value: Int
    
    var body: some View {
        Circle()
            .fill(.thickMaterial)
            .overlay {
                Text("\(value)")
                    .foregroundStyle(Constants.gradient)
                    .font(.largeTitle)
                    .fontWeight(.medium)
            }
            .frame(
                width: Constants.sizeCircles,
                height: Constants.sizeCircles
            )
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        HStack {
            NumberCircleViewComponent(value: 5)
            
            Text("Steals")
                .font(.title2)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
            
            NumberCircleViewComponent(value: 7)
        }
        .padding()
    }
}
