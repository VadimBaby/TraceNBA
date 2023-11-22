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
        
        UIRefreshControl.appearance().tintColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selection) {
            SearchView(dataService: dataService)
                .tabItem {
                    VStack {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                }
                .tag(0)
            
            StreamMatchesView(dataService: dataService)
                .tabItem {
                    VStack {
                        Text("Streams")
                        Image(systemName: "dot.radiowaves.left.and.right")
                    }
                }
                .tag(1)
            
            EventsView(dataService: dataService)
                .tabItem {
                    VStack {
                        Text("Events")
                        Image(systemName: "calendar")
                    }
                }
                .tag(2)
            
            Text("Settings")
                .tabItem {
                    VStack {
                        Text("Settings")
                        Image(systemName: "gear")
                    }
                }
                .tag(3)
        }
        .tint(Color.green)
    }
}

#Preview {
    TabBarView()
}
