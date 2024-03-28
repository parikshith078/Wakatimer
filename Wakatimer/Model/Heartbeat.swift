    //
    //  Heardbeat.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 24/03/24.
    //

import Foundation

struct Heartbeat: Codable, Identifiable {
    var id: Double {
        return time
    }
    let time: Double
    let project: String
    let duration: Double
}

