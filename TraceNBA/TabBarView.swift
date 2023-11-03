//
//  TabBarView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 01.11.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection: Int = 0
    
    let dataService: DataServiceProtocol = DataService()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Start")
                .tabItem {
                    VStack {
                        Text("house")
                        Image(systemName: "house")
                    }
                }
                .tag(0)
            
            StreamMatchesView(dataService: dataService)
                .tabItem {
                    VStack {
                        Text("Streams")
                        Image(systemName: "star")
                    }
                }
                .tag(1)
        }
        .tint(Color.green)
    }
}

#Preview {
    TabBarView()
}
