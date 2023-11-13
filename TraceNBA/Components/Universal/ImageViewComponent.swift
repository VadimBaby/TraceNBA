//
//  ImageViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 12.11.2023.
//

import SwiftUI

struct ImageViewComponent: View {
    
    @StateObject private var viewModel: ImageViewComponetViewModel
    
    let id: Int
    let typeEntity: TypeEntity
    let imageScale: CGFloat
    let colorProgressView: Color
    
    init(id: Int, typeEntiy: TypeEntity, imageScale: CGFloat = 70, colorProgressView: Color = Color.gray, dataService: DataServiceProtocol) {
        self.id = id
        self._viewModel = StateObject(wrappedValue: ImageViewComponetViewModel(dataService: dataService))
        self.imageScale = imageScale
        self.typeEntity = typeEntiy
        self.colorProgressView = colorProgressView
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: imageScale, height: imageScale)
            } else {
                ProgressView()
                    .tint(colorProgressView)
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
        
        ImageViewComponent(id: 1, typeEntiy: .team, colorProgressView: Color.white, dataService: DataService())
    }
}
