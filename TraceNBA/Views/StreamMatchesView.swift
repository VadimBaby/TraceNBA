//
//  StreamMatchesView.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import SwiftUI

struct StreamMatchesView: View {
    
    @StateObject private var viewModel: StreamMatchesViewModel
    
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self._viewModel = StateObject(wrappedValue: StreamMatchesViewModel(manager: dataService))
        
        self.dataService = dataService
    }
    
    var body: some View {
        ScrollView {
            VStack {
                LiveComponent()
                    .frame(width: 250, height: 50)
                ForEach(viewModel.listLiveMatches) { match in
                    MatchItemViewComponent(
                        matchModel: match,
                        dataService: dataService)
                }
            }
        }
        .onAppear {
            viewModel.getListLiveMatches()
        }
        .onDisappear {
            viewModel.cancelAllTasks()
        }
    }
}

#Preview {
    ZStack {
        LinearGradient(gradient: Gradient(colors: [Color("FirstGradientColor"), Color("SecondGradientColor")]), startPoint: .leading, endPoint: .trailing)
            .ignoresSafeArea()
        
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
            
            StreamMatchesView(dataService: DataService())
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
}
