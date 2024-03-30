//
//  File.swift
//  Today StatsExtension
//
//  Created by Parikshith Palegar on 30/03/24.
//

import Foundation
import SwiftUI

struct DataService {
    @AppStorage("todayStats",
                store: UserDefaults(suiteName: "group.me.parikshith.One-tap"))
    private var todayStats = ""
    
    func getStatus() -> String {
//        print("Today stats: \(todayStats)")
        return todayStats
    }
}
