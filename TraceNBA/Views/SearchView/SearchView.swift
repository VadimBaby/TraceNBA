//
//  SearchView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import SwiftUI

struct SearchView: View {
    
    let dataService: DataServiceProtocol
    
    @StateObject public var viewModel: SearchViewModel
    
    @State public var search: String = ""
    
    @FocusState public var searchFocus: Bool
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        self._viewModel = StateObject(wrappedValue: SearchViewModel(dataService: dataService))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                GradientComponent()
                
                VStack {
                    searchView
                    
                    content
                        .onTapGesture {
                            searchFocus = false
                        }
                }
            }
            .onDisappear {
                viewModel.cancelAllTasks()
            }
        }
        .tint(Color.white)
    }
}

#Preview {
    SearchView(dataService: MockDataService<DataModel>())
}
