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
        ZStack {
            GradientComponent()
            
            if let matches = viewModel.listLiveMatches {
                ScrollView {
                    LazyVStack {
                        LiveComponent()
                            .frame(width: 250, height: 50)
                        if matches.isEmpty {
                            NoDataViewComponent(message: .noLiveMatches)
                        } else {
                            ForEach(matches) { match in
                                MatchItemViewComponent(
                                    matchModel: match,
                                    dataService: dataService)
                            }
                            
                            PlugRectangleViewComponent()
                        }
                    }
                }
            } else {
                ProgressView()
                    .tint(Color.white)
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
    TabView(selection: .constant(2)) {
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
        
        StreamMatchesView(dataService: DataService())
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
    .onAppear {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
