//
//  TabBarView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 01.11.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection: TabItem = TabItem(title: "Home", iconName: "house")
    
    var body: some View {
        CustomTabBarContainerView(
            selection: $selection,
            iconColor: Color.green
        ) {
            Text("Home")
                .tabBarItem (
                    tab: TabItem(title: "Home", iconName: "house"),
                    selection: $selection
                )
            
            Text("Search")
                .tabBarItem (
                    tab: TabItem(title: "Search", iconName: "magnifyingglass"),
                    selection: $selection
                )
            
            Text("Streams")
                .tabBarItem (
                    tab: TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right"),
                    selection: $selection
                )
            
            Text("Events")
                .tabBarItem (
                    tab: TabItem(title: "Events", iconName: "calendar"),
                    selection: $selection
                )
            
            Text("Settings")
                .tabBarItem (
                    tab: TabItem(title: "Settings", iconName: "gear"),
                    selection: $selection
                )
        }
    }
}

#Preview {
    TabBarView()
}
