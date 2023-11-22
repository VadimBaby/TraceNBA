//
//  ProgressCircleViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 09.11.2023.
//

import SwiftUI

struct ProgressCircleViewComponent: View {
    
    let value: Int
    let total: Int
    
    private let gradient: LinearGradient = LinearGradient(
        colors: [Color.blue, Color.purple],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    private var percent: Int {
        guard total != 0 else { return Int(0) }
        
        let result: Double = round(Double(value) / Double(total) * 100)
        
        return Int(result)
    }
    
    private var trimTo: CGFloat {
        let dividePercent: Double = Double(percent) / 100
        
        return CGFloat(dividePercent)
    }
    
    var body: some View {
        Circle()
            .stroke(.black.opacity(0.5), style: StrokeStyle(lineWidth: 15, lineCap: .round))
            .overlay {
                Circle()
                    .trim(from: 0, to: trimTo)
                    .stroke(gradient, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .overlay {
                        VStack {
                            Text("\(percent)%")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                            
                            Text("\(value)/\(total)")
                                .font(.headline)
                                .foregroundStyle(Color.white.opacity(0.8))
                        }
                    }
                
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
            ProgressCircleViewComponent(value: 5, total: 7)
            
            Text("Free throws")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color.white)
            
            ProgressCircleViewComponent(value: 5, total: 7)
        }
        .padding(20)
    }
}
