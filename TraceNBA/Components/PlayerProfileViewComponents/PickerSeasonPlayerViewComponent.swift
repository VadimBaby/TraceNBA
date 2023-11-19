//
//  PickerSeasonPlayerViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 19.11.2023.
//

import SwiftUI

struct PickerSeasonPlayerViewComponent: View {
    
    @ObservedObject public var viewModel: PlayerProfileViewModel
    
    var body: some View {
        if let isActiveSeason = viewModel.isActiveSeason {
            HStack(spacing: 30) {
                Image(systemName: "chevron.compact.left")
                    .onTapGesture {
                        viewModel.setPreviousSeason()
                    }
                
                Text(isActiveSeason.name)
                    .frame(width: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                
                Image(systemName: "chevron.compact.right")
                    .onTapGesture {
                        viewModel.setNextSeason()
                    }
            }
            .font(.system(.title2, design: .rounded, weight: .medium))
            .foregroundStyle(Color.white)
            .frame(height: 60)
        }
    }
}

#Preview(body: {
    @StateObject var viewModel = PlayerProfileViewModel(
        idPlayer: 1,
        dataService: MockDataService<DataModel>()
    )
    
    return ZStack {
        GradientComponent()
        
        PickerSeasonPlayerViewComponent(
            viewModel: viewModel
        )
        .onAppear {
            viewModel.getPlayerSeasons()
        }
    }
})
