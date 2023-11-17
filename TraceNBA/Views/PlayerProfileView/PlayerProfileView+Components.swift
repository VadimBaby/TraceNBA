//
//  PlayerProfileView+Components.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 17.11.2023.
//

import SwiftUI

extension PlayerProfileView {
    
}

#Preview {
    NavigationStack {
        PlayerProfileView(
            idPlayer: 1,
            dataService: MockDataService<DataModel>()
        )
    }
}
