//
//  HighlightsViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

struct HighlightsViewComponent: View {
    
    let highlights: [HighlightModel]?
    let noDataMessage: NoDataMessage
    let dataService: DataServiceProtocol
    
    var body: some View {
        if let highlights {
            if !highlights.isEmpty {
                ScrollView {
                    VStack(spacing: 30) {
                        ForEach(highlights) { item in
                            HighlightsItemViewComponent(
                                highlight: item,
                                dataService: dataService
                            )
                        }
                        PlugRectangleViewComponent()
                    }
                    .padding()
                }
            } else {
                VStackMaxHeight {
                    NoDataViewComponent(message: noDataMessage)
                }
            }
        } else {
            VStackMaxHeight {
                ProgressView()
                    .tint(Color.white)
            }
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        HighlightsViewComponent(
            highlights: FakeData.fakeMatchHighlights,
            noDataMessage: .noMatchHighlights,
            dataService: DataService()
        )
    }
}
