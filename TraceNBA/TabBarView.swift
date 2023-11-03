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
            Text("Home")
                .tabItem {
                    VStack {
                        Text("Home")
                        Image(systemName: "house")
                    }
                }
                .tag(0)
            
            Text("Search")
                .tabItem {
                    VStack {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                }
                .tag(1)
            
            StreamMatchesView(dataService: dataService)
                .tabItem {
                    VStack {
                        Text("Streams")
                        Image(systemName: "dot.radiowaves.left.and.right")
                    }
                }
                .tag(2)
            
            Text("Events")
                .tabItem {
                    VStack {
                        Text("Events")
                        Image(systemName: "calendar")
                    }
                }
                .tag(3)
            
            Text("Settings")
                .tabItem {
                    VStack {
                        Text("Settings")
                        Image(systemName: "gear")
                    }
                }
                .tag(4)
        }
        .tint(Color.green)
    }
}

#Preview {
    TabBarView()
}
