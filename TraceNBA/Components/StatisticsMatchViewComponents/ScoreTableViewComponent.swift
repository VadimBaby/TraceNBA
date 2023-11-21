//
//  ScoreTableViewComponent.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 08.11.2023.
//

import SwiftUI

struct ScoreTableViewComponent: View {
    
    let homeNameCode: String
    let awayHomeCode: String
    let homeScore: ScoreModel
    let awayScore: ScoreModel
    
    var body: some View {
        VStack {
            namePeriodLine
                .padding(.bottom, 1)
            
            
            getTeamScoreLine(nameCode: homeNameCode, score: homeScore)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 1)
            
            getTeamScoreLine(nameCode: awayHomeCode, score: awayScore)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.thinMaterial)
        )
    }
}

extension ScoreTableViewComponent {
    @ViewBuilder private var namePeriodLine: some View {
        HStack {
            TextMaxWidth(text: "Team")
            
            if homeScore.period1 != nil && awayScore.period1 != nil {
                TextMaxWidth(text: "Q1")
            }
            
            if homeScore.period2 != nil && awayScore.period2 != nil  {
                TextMaxWidth(text: "Q2")
            }
            
            if homeScore.period3 != nil && awayScore.period3 != nil  {
                TextMaxWidth(text: "Q3")
            }
            
            if homeScore.period4 != nil && awayScore.period4 != nil  {
                TextMaxWidth(text: "Q4")
            }
            
            if homeScore.overtime != nil && awayScore.overtime != nil  {
                TextMaxWidth(text: "OT")
            }
            
            if homeScore.current != nil && awayScore.current != nil  {
                TextMaxWidth(text: "AG")
            }
        }
        .foregroundStyle(Color.gray)
    }
    
    @ViewBuilder private func getTeamScoreLine(nameCode: String, score: ScoreModel) -> some View {
        HStack {
            TextMaxWidth(text: nameCode)
                
            if let period1 = score.period1 {
                TextMaxWidth(text: "\(period1)")
            }
            
            if let period2 = score.period2 {
                TextMaxWidth(text: "\(period2)")
            }
            
            if let period3 = score.period3 {
                TextMaxWidth(text: "\(period3)")
            }
            
            if let period4 = score.period4 {
                TextMaxWidth(text: "\(period4)")
            }
            
            if let overtime = score.overtime {
                TextMaxWidth(text: "\(overtime)")
            }
            
            if let current = score.current {
                TextMaxWidth(text: "\(current)")
            }
        }
        .foregroundStyle(Color.black)
    }
    
    @ViewBuilder private func TextMaxWidth(text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ZStack {
        GradientComponent()
        
        ScoreTableViewComponent(
            homeNameCode: "GSW",
            awayHomeCode: "LAL",
            homeScore: ScoreModel(
                current: 86,
                display: 86,
                period1: 28,
                period2: 28,
                period3: 18,
                period4: 12
            ),
            awayScore: ScoreModel(
                current: 85,
                display: 85,
                period1: 31,
                period2: 31,
                period3: 24,
                period4: 6
            )
        )
        .padding()
    }
}
