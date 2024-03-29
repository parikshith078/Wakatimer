//
//  WakatimeData.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 29/03/24.
//

import Foundation
import SwiftData

@Model
class WakatimeApiData: Codable {
    var day: Date
    @Relationship(deleteRule: .cascade) var heartbeats: [Heartbeat]
    
    init(day: Date = .now, heartbeats: [Heartbeat] = [Heartbeat]()) {
        self.day = day
        self.heartbeats = heartbeats
    }
}


