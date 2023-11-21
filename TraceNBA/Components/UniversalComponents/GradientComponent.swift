//
//  GradientComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import SwiftUI

struct GradientComponent: View {
    var body: some View {
        Constants.gradient
            .ignoresSafeArea()
    }
}

#Preview {
    GradientComponent()
}
