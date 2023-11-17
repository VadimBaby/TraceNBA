//
//  PlayerProfileView+Toolbar.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import Foundation
import SwiftUI

extension PlayerProfileView {
    @ViewBuilder public var centerToolbarItem: some View {
        Text("Player Profile")
            .font(.headline)
            .foregroundStyle(Color.white)
    }
}
