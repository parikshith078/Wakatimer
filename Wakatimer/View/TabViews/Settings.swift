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
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    TextField("API key", text: $key)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                    
                    Button("Save") {
                        apiKey = key.lowercased()
                    }
                }
                .padding(20)
            }
            
        }
    }
}

#Preview {
    Settings()
}
