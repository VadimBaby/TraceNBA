//
//  NoDataViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import SwiftUI

struct NoDataViewComponent: View {
    
    let message: NoDataMessage
    
    var body: some View {
        Text(message.rawValue)
            .foregroundStyle(Color.white)
            .font(.system(size: 35, weight: .medium, design: .rounded))
            .padding()
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        NoDataViewComponent(message: .noScheduleMatches)
    }
}
