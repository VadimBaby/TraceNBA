//
//  TeamProfileView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 20.11.2023.
//

import SwiftUI

struct TeamProfileView: View {
    
    let id: Int
    let dataSerivce: DataServiceProtocol
    
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
        dataSerivce: MockDataService<DataModel>()
    )
}
