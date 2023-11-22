//
//  PlayerSearchItemViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import SwiftUI

struct SearchItemViewComponent: View {
    
    let result: SearchModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        NavigationLink(destination: {
            if result.type == .player {
                PlayerProfileView(
                    idPlayer: result.entity.id,
                    dataService: dataService
                )
            } else if result.type == .team {
                TeamProfileView(
                    id: result.entity.id,
                    dataService: dataService
                )
            }
        }) {
            HStack {
                ImageViewComponent(
                    id: result.entity.id,
                    typeEntiy: result.type,
                    dataService: dataService
                )
                .clipShape(.rect(cornerRadius: result.type == .player ? 15 : 0))
                
                Text(result.entity.name)
                    .foregroundStyle(Color.primary)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thinMaterial)
            }
        }
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        SearchItemViewComponent(
            result: FakeData.fakeSearchResults.first!,
            dataService: MockDataService<DataModel>()
        )
    }
}
