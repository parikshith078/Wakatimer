    //
    //  NetworkService.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 28/03/24.
    //

import Foundation
import SwiftUI

struct NetworkService {
    
    @AppStorage("API_KEY") var apiKey = ""
    
    private var url : String {
        return "https://wakatime.com/api/v1/users/current/durations?date=2024-03-29&api_key=\(apiKey)"
    }
    
    func fetchData() async throws -> [Heartbeat] {
            //        print("DEBUG: Entered service class")
        print("Api key \(apiKey)")
        guard let safeURL = URL(string: url) else {
            throw NetworkError.requestFailed(description: "Failed to get URL")
        }
            //        print("URL generated ")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: safeURL)
            print("Reviced data \(data)")
            do {
                    //                print("Decoing started")
                let heartbeats = try JSONDecoder().decode(NetworkData.self, from: data)
                    //                print("Decoding complete: \(heartbeats)")
                return heartbeats.data
            } catch {
                    //                print("Error while parsing \(error)")
                throw NetworkError.jsonParsingFailure
            }
        } catch {
                //            print("Error Unknow")
            throw NetworkError.unknowError(error)
        }
    }
    
    func fetchTodayStats() async throws -> String {
        let data = try await fetchData()
        
        var totalTimeSec: Double = 0
        
        for entry in data {
            totalTimeSec += entry.duration
        }
            //        print("Debug: total time in sec = \(totalTimeSec)")
        
        let totalHours = Int(totalTimeSec / 3600 )
        let totalMinute = Int(totalTimeSec.truncatingRemainder(dividingBy: 3600) / 60)
            //        print("Debug: total time in hours = \(totalHours)")
            //        print("Debug: total time in minute = \(totalMinute)")
        
        let todayStats = "\(totalHours)h \(totalMinute)m"
        print("Debug: \(todayStats)")
        
        return todayStats
    }
}


struct NetworkData: Codable {
    let data: [Heartbeat]
}
