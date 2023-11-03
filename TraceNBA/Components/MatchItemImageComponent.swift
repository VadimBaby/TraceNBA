//
//  MatchItemImageComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 03.11.2023.
//

import SwiftUI

struct MatchItemImageComponent: View {
    
    let id: Int
    let imageScale: CGFloat = 70
    
    var body: some View {
        Circle()
            .frame(width: imageScale, height: imageScale)
    }
}

#Preview {
    MatchItemImageComponent(id: 1)
}
