//
//  SearchView+Content.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import SwiftUI

extension SearchView {
    @ViewBuilder public var content: some View {
        if let results = viewModel.results {
            if !results.isEmpty {
                ScrollView {
                    VStack {
                        ForEach(results, id: \.entity.id) { result in
                            Text(result.entity.name)
                        }
                    }
                }
            } else {
                VStackMaxHeight {
                    NoDataViewComponent(message: .noSearchResults)
                }
            }
        } else {
            VStackMaxHeight {
                ProgressView()
                    .tint(Color.white)
            }
        }
    }
}

#Preview {
    SearchView(dataService: MockDataService<DataModel>())
}
