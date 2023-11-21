//
//  NearMatchesItem.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

struct NearMatchesItemComponent: View {
    
    let event: MatchModel
    let typeEvent: TypeNearMatch
    let dataService: DataServiceProtocol
    
    var body: some View {
        VStack {
            Text(typeEvent.rawValue)
                .font(.title)
                .foregroundStyle(Color.white)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            NavigationLink(destination: {
                StatisticsMatchView(
                    matchModel: event,
                    dataService: dataService
                )
            }, label: {
                MatchItemViewComponent(
                    matchModel: event,
                    dataService: dataService
                )
                .tint(Color.black)
            })
        }
    }
}

#Preview {
    NearMatchesItemComponent(
        event: FakeData.fakeListLiveMatches.first!,
        typeEvent: .nextMatch,
        dataService: MockDataService<DataModel>()
    )
}
