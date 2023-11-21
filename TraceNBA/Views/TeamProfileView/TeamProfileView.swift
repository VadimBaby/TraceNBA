//
//  TeamProfileView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 20.11.2023.
//

import SwiftUI

struct TeamProfileView: View {
    let id: Int
    let dataService: DataServiceProtocol
    
    @StateObject private var viewModel: TeamProfileViewModel
    
    init(id: Int, dataService: DataServiceProtocol) {
        self.id = id
        self.dataService = dataService
        self._viewModel = StateObject(wrappedValue: TeamProfileViewModel(
            id: id,
            dataService: dataService
        ))
    }
    
    var body: some View {
        ZStack {
            GradientComponent()
            
            if let teamDetails = viewModel.teamDetails {
                if !viewModel.hasErrorTeamDetails {
                    Text("Lets go")
                } else {
                    VStackMaxHeight {
                        NoDataViewComponent(message: .noTeamDetails)
                    }
                }
            } else {
                VStackMaxHeight {
                    ProgressView()
                        .tint(Color.white)
                }
            }
        }
        .onAppear {
            viewModel.getTeamDetails()
        }
        .onDisappear {
            viewModel.cancelAllTasks()
        }
    }
}

#Preview {
    NavigationStack {
        TeamProfileView(
            id: 1,
            dataService: MockDataService<DataModel>()
        )
    }
}
