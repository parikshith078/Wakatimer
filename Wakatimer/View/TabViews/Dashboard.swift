//
//  Dashboard.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 29/03/24.
//

import SwiftUI

struct Dashboard: View {
    @AppStorage("API_KEY") var apiKey = ""
    var viewModle = NetworkViewModel()
    var body: some View {
        VStack(spacing: 30) {
            Text("Dashboard tab")
                .onTapGesture {
                    print(apiKey)
                    Task {
                        try await viewModle.fetchData()
                    }
                }
            Text("API Key: \(apiKey)")
        }
    }
}

#Preview {
    Dashboard()
}
