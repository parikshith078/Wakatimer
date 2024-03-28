    //
    //  NetworkService.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 28/03/24.
    //

import Foundation

struct NetworkService {
    
    private let url = ""
    
    func fetchData() async throws -> [Heartbeat] {
//        print("DEBUG: Entered service class")
        guard let safeURL = URL(string: url) else {
            throw NetworkError.requestFailed(description: "Failed to get URL")
        }
//        print("URL generated ")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: safeURL)
//            print("Reviced data \(data)")
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
}


struct NetworkData: Codable {
    let data: [Heartbeat]
}
