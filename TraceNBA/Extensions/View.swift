//
//  View.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 14.11.2023.
//

import Foundation
import SwiftUI

extension View {
    func onScrollViewOffsetChanged(action: @escaping (_ value: CGFloat) -> Void) -> some View {
        self
            .background {
                GeometryReader { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .scrollView).maxY)
                }
            }
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
                action(value)
            })
    }
}
