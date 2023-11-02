//
//  StreamMatchesView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import SwiftUI

struct StreamMatchesView: View {
    var body: some View {
        Text("Hello World")
    }
}

#Preview {
    CustomTabBarContainerView(
        selection: .constant(TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right")),
        iconColor: Color.green
    ) {
        Text("Home")
            .tabBarItem (
                tab: TabItem(title: "Home", iconName: "house"),
                selection: .constant(TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right"))
            )
        
        Text("Search")
            .tabBarItem (
                tab: TabItem(title: "Search", iconName: "magnifyingglass"),
                selection: .constant(TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right"))
            )
        
        StreamMatchesView()
            .tabBarItem (
                tab: TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right"),
                selection: .constant(TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right"))
            )
        
        Text("Events")
            .tabBarItem (
                tab: TabItem(title: "Events", iconName: "calendar"),
                selection: .constant(TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right"))
            )
        
        Text("Settings")
            .tabBarItem (
                tab: TabItem(title: "Settings", iconName: "gear"),
                selection: .constant(TabItem(title: "Streams", iconName: "dot.radiowaves.left.and.right"))
            )
    }
}
