//
//  TransferItemViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 19.11.2023.
//

import SwiftUI

struct TransferItemViewComponent: View {
    
    let transfer: TransferModel
    let dataService: DataServiceProtocol
    
    var body: some View {
        VStack {
            HStack {
                getTransferTeam(team: transfer.transferFrom)
                
                Image(systemName: "arrow.right")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                
                getTransferTeam(team: transfer.transferTo)
            }
            
            Text("\(transfer.transferDateTimestamp.getStringDate())")
                .font(.headline)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.thinMaterial)
        }
        .padding(.horizontal)
    }
}

extension TransferItemViewComponent {
    @ViewBuilder private func getTransferTeam(team: TeamModel?) -> some View  {
        VStack {
            if let team {
                ImageViewComponent(
                    id: team.id,
                    typeEntiy: .team,
                    dataService: dataService
                )
                
                Text(team.shortName)
                    .font(.title3)
                    .fontWeight(.medium)
            } else if let pick = transfer.pick,
                      let round = transfer.round {
                Text("NBA Draft:")
                    .font(.title3)
                    .fontWeight(.medium)
                Text("Round: \(round)")
                    .font(.headline)
                Text("Pick: \(pick)")
                    .font(.headline)
            }
        }
        .frame(width: 130)
        .foregroundStyle(Color.black)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        TransferItemViewComponent(
            transfer: FakeData.fakePlayerTransferHistory.last!,
            dataService: MockDataService<DataModel>()
        )
    }
}
