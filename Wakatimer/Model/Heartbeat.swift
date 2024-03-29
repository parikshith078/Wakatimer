    //
    //  Heardbeat.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 24/03/24.
    //

import Foundation
import SwiftData

@Model
class Heartbeat: Codable {
    var time: Double
    var project: String
    var duration: Double
    
    init(time: Double = 0, project: String = "", duration: Double = 0) {
        self.time = time
        self.project = project
        self.duration = duration
    }
}

