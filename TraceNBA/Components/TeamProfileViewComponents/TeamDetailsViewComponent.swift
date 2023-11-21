//
//  TeamDetailsViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 21.11.2023.
//

import SwiftUI

struct TeamDetailsViewComponent: View {
    
    let team: TeamModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    ImageViewComponent(
                        id: team.id,
                        typeEntiy: .team,
                        colorProgressView: Color.white,
                        dataService: dataService
                    )
                    Text(team.name)
                        .foregroundStyle(Color.white)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let manager = team.manager {
                    VStack {
                        ImageViewComponent(
                            id: manager.id,
                            typeEntiy: .manager,
                            colorProgressView: Color.white,
                            dataService: dataService
                        )
                        .clipShape(.rect(cornerRadius: 5))
                        Text(manager.name)
                            .foregroundStyle(Color.white)
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                }
            }
            
            if let venue = team.venue {
                VStack(alignment: .leading) {
                    if let city = venue.city {
                        Text("City: " + city.name)
                            
                    }
                    
                    if let stadium = venue.stadium {
                        Text("Stadium: " + stadium.name)
                    }
                }
                .foregroundStyle(Color.white)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ZStack {
            GradientComponent()
            
            TeamDetailsViewComponent(
                team: FakeData.fakeTeam,
                dataService: MockDataService<DataModel>()
            )
            .padding()
        }
    }
}
