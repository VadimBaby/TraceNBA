//
//  LiveComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import SwiftUI

struct LiveComponent: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.red)
            .overlay {
                HStack {
                    Text("LIVE")
                    Image(systemName: "play.circle.fill")
                }
                .foregroundStyle(Color.white)
                .font(.system(.title, design: .rounded, weight: .bold))
            }
    }
}

#Preview {
    LiveComponent()
        .frame(width: 250, height: 50)
}
