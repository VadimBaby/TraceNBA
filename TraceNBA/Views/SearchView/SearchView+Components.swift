//
//  SearchView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 22.11.2023.
//

import SwiftUI

extension SearchView {
    @ViewBuilder public var searchView: some View {
        HStack {
            TextField("Search:", text: $search)
                .foregroundStyle(Color.primary)
                .padding()
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.thinMaterial)
                }
                .tint(Color.primary)
            
            Button(action: {
                if !search.isEmpty {
                    viewModel.search(search: search)
                }
            }) {
                if viewModel.results != nil {
                    Text("Search")
                        .foregroundStyle(search.isEmpty ? Color.gray : Color.white)
                        .padding(.vertical)
                        .frame(width: 90)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(search.isEmpty ? Color.lightText : Color.blue)
                        }
                } else {
                    ProgressView()
                        .tint(Color.black)
                        .padding(.vertical)
                        .frame(width: 90)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.lightText)
                        }
                }
            }
            .disabled(search.isEmpty || viewModel.results == nil)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView(dataService: MockDataService<DataModel>())
}
