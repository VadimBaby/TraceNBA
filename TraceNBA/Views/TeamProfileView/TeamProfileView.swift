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
            
            Text("TeamProfileView")
        }
    }
}

#Preview {
    TeamProfileView(
        id: 1,
        dataService: MockDataService<DataModel>()
    )
}
