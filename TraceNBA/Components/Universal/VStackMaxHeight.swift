//
//  VStackMaxHeight.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 15.11.2023.
//

import SwiftUI

struct VStackMaxHeight<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    VStackMaxHeight() {
        Text("One")
    }
}
