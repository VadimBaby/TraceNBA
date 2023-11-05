//
//  NoLiveMatchViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import SwiftUI

struct NoLiveMatchViewComponent: View {
    var body: some View {
        Text("Unfortunately, none of the teams aren't playing now")
            .foregroundStyle(Color.white)
            .font(.system(size: 35, weight: .medium, design: .rounded))
            .padding()
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        ScrollView {
            VStack {
                LiveComponent()
                    .frame(width: 250, height: 50)
                
                NoLiveMatchViewComponent()
            }
        }
    }
}
