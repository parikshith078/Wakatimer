//
//  WakatimerApp.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 24/03/24.
//

import SwiftUI
import SwiftData

@main
struct WakatimerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: WakatimeApiData.self)
    }
}
