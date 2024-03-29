    //
    //  ContentView.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 24/03/24.
    //

    // Assuming you have a Data model for the response JSON structure
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkModel = NetworkViewModel()
    @State private var activeTab: Tab = .dashboard
    
    var body: some View {
        TabView(selection: $activeTab) {
            Dashboard()
                .tag(Tab.dashboard)
                .tabItem { Tab.dashboard.tabContent }
                .onAppear {
                    Task {
                        try await networkModel.fetchData()
                    }
                }

            Settings()
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        
    }
}

#Preview {
    ContentView()
}

