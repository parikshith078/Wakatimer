    //
    //  ContentView.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 24/03/24.
    //

    // Assuming you have a Data model for the response JSON structure
import SwiftUI

struct ContentView: View {
    
    @StateObject var apiData = NetworkViewModel()
    
    var body: some View {
        Text("Fetch Coding Statistics")
            .onTapGesture {
                Task {
                    print("Starting fetching...")
                    try await apiData.fetchData()
                }
            }
        List {
            ForEach(apiData.heartbeats){ item in
                Text(item.project)
            }
        }
    }
}

#Preview {
    ContentView()
}

