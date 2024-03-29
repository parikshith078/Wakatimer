    //
    //  NetworkViewModel.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 28/03/24.
    //

import Foundation
import SwiftUI

class NetworkViewModel: ObservableObject {
    @Published var heartbeats = [Heartbeat]()
    @AppStorage("todayStats",
                store: UserDefaults(suiteName: "group.me.parikshith.One-tap"))
    private var todayStats = ""
    
    let service = NetworkService()
    
    
    func fetchData() async throws {
        print("DEBUG: data = (self.apiData) started...")
        DispatchQueue.main.async {
            Task {
                self.todayStats = try await self.service.fetchTodayStats()
            }
        }
    }
//    init() {
//        Task {
//            try await self.fetchData()
//            print("Done: \(self.heartbeats)")
//        }
//    }
}
