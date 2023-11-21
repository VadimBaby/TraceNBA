//
//  TeamProfileView+Toolbar.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

extension TeamProfileView {
    @ViewBuilder public var centerToolbarItem: some View {
        Text("Team Profile")
            .font(.headline)
            .foregroundStyle(Color.white)
    }
}

#Preview {
    TeamProfileView(
        id: 1,
        dataService: MockDataService<DataModel>()
    )
}
