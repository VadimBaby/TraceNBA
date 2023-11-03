//
//  MatchItemImageComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 03.11.2023.
//

import SwiftUI

struct MatchItemImageComponent: View {
    
    @StateObject private var viewModel: MatchItemImageViewModel
    
    let id: Int
    let imageScale: CGFloat = 70
    
    init(id: Int, dataService: DataServiceProtocol) {
        self.id = id
        self._viewModel = StateObject(wrappedValue: MatchItemImageViewModel(dataService: dataService))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: imageScale, height: imageScale)
            } else {
                ProgressView()
                    .tint(Color.gray)
                    .frame(width: imageScale, height: imageScale)
            }
        }
        .task {
            await viewModel.getTeamImage(id: id)
        }
    }
}

#Preview {
    MatchItemImageComponent(id: 1, dataService: DataService())
}
