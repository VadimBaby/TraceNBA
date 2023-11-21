//
//  PlugRectangleViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import SwiftUI

struct PlugRectangleViewComponent: View {
    var body: some View {
        Rectangle()
            .fill(.clear)
            .frame(height: 30)
    }
}

#Preview {
    PlugRectangleViewComponent()
}
