//
//  Settings.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 29/03/24.
//

import SwiftUI

struct Settings: View {
    @State var key = ""
    @AppStorage("API_KEY") var apiKey = ""
    var body: some View {
        VStack(spacing: 20) {
            TextField("API key", text: $key)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
            
            Button("Save") {
                apiKey = key.lowercased()
            }
            
        }
        .padding()
    }
}

#Preview {
    Settings()
}
