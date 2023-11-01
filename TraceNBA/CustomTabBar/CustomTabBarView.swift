//
//  CustomTabBarView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 01.11.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabItem]
    
    let iconColor: Color
    
    @Binding var selection: TabItem
    
    @Namespace private var namespace
    
    var body: some View {
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .background(.thickMaterial)
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.system(size: 20, weight: .bold, design: .monospaced))
            Text(tab.title)
                .font(.caption)
        }
        .foregroundStyle(selection == tab ? iconColor : Color.gray)
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity)
    }
    
    private func switchToTab(tab: TabItem) {
        selection = tab
    }
}
#Preview {
    VStack{
        Spacer()
        CustomTabBarView(tabs: [
            TabItem(title: "Home", iconName: "house"),
            TabItem(title: "Gear", iconName: "gear"),
            TabItem(title: "Heart", iconName: "heart.fill")
        ], iconColor: Color.green, selection: .constant(TabItem(title: "Home", iconName: "house")))
    }
    .background {
        Color.orange.ignoresSafeArea()
    }
}

