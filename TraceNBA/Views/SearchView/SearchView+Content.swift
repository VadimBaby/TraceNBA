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
                    LazyVStack(spacing: 30) {
                        ForEach(results, id: \.entity.id) { result in
                            SearchItemViewComponent(
                                result: result,
                                dataService: dataService
                            )
                        }
                    }
                    .padding()
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
