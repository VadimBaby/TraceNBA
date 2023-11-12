//
//  ImageViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

struct ImageViewComponent: View {
    
    @StateObject private var viewModel: MatchItemImageViewModel
    
    let id: Int
    let typeEntity: TypeEntity
    let imageScale: CGFloat
    
    init(id: Int, typeEntiy: TypeEntity, imageScale: CGFloat = 70, dataService: DataServiceProtocol) {
        self.id = id
        self._viewModel = StateObject(wrappedValue: MatchItemImageViewModel(dataService: dataService))
        self.imageScale = imageScale
        self.typeEntity = typeEntiy
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
            await viewModel.getTeamImage(id: id, entity: typeEntity)
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        ImageViewComponent(id: 1, typeEntiy: .team, dataService: DataService())
    }
}
