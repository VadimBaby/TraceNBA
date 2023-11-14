//
//  ScrollViewPreferenceKey.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 14.11.2023.
//

import Foundation
import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
