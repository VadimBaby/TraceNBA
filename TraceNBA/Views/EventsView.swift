//
//  EventsView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        ZStack {
            GradientComponent()
            
            Text("Events")
        }
    }
}

#Preview {
    TabView(selection: .constant(3)) {
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
        
        Text("Streams")
            .tabItem {
                VStack {
                    Text("Streams")
                    Image(systemName: "dot.radiowaves.left.and.right")
                }
            }
            .tag(2)
        
        EventsView()
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
    .onAppear {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
