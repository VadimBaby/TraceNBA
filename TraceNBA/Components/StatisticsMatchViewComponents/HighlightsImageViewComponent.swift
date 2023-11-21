//
//  HighlightsImageViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

struct HighlightsImageViewComponent: View {
    
    @StateObject private var viewModel: ImageViewComponetViewModel
    
    let urlString: String
    
    init(urlString: String, dataService: DataServiceProtocol) {
        self.urlString = urlString
        self._viewModel = StateObject(wrappedValue: ImageViewComponetViewModel(dataService: dataService))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                    
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 60))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(
                            .ultraThickMaterial,
                            .regularMaterial,
                            .ultraThinMaterial
                        )
                }
            } else {
                VStack {
                    ProgressView()
                        .tint(Color.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            }
        }
        .task {
            await viewModel.getHighlightImage(urlString: urlString)
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        HighlightsImageViewComponent(urlString: FakeData.fakeMatchHighlights.first!.thumbnailUrl, dataService: DataService())
    }
}
