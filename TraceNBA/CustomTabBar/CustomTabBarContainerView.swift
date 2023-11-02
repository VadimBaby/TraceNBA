//
//  CustomTabBarContainerView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 01.11.2023.
//

import SwiftUI

struct CustomTabBarContainerView<Content>: View where Content: View {
    
    @Binding var selection: TabItem
    
    let content: Content
    
    let iconColor: Color
    
    @State private var tabs: [TabItem] = []
    
    init(selection: Binding<TabItem>, iconColor: Color, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
        self.iconColor = iconColor
    }
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
              //  .ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs, iconColor: iconColor, selection: $selection)
        })
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    CustomTabBarContainerView(selection: .constant(TabItem(title: "home", iconName: "house")), iconColor: Color.green) {
        Color.red
            .tabBarItem(
                tab: TabItem(title: "home", iconName: "house"),
                selection: .constant(TabItem(title: "home", iconName: "house"))
            )
        
        Color.orange
            .tabBarItem(
                tab: TabItem(title: "settings", iconName: "gear"),
                selection: .constant(TabItem(title: "home", iconName: "house"))
            )
    }
}
