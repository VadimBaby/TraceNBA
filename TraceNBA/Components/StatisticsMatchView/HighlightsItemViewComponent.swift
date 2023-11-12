//
//  HighlightsItemViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

struct HighlightsItemViewComponent: View {
    
    let highlight: HighlightModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        if let url = URL(string: highlight.url) {
            Link(destination: url, label: {
                VStack {
                    HighlightsImageViewComponent(
                        urlString: highlight.thumbnailUrl,
                        dataService: dataService
                    )
                    Text(highlight.title.uppercased())
                        .foregroundStyle(Color.white)
                        .font(.title2)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Text(highlight.subtitle.uppercased())
                        .font(.headline)
                        .foregroundStyle(Color(uiColor: UIColor.lightText))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
            })
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        ScrollView {
            VStack {
                HighlightsItemViewComponent(highlight: FakeData.fakeMatchHighlights.first!, dataService: DataService())
            }
            .padding()
        }
    }
}
