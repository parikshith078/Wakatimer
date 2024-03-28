//
//  NetworkError.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 28/03/24.
//

import Foundation

enum NetworkError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidSatusCode(statusCode: Int)
    case unknowError(_ error: Error)
    
    var customDescription: String {
        switch self {
            case .invalidData:
                return "Invalid Data"
            case .jsonParsingFailure:
                return "Failed to parse JSON"
            case let .requestFailed(description):
                return "Request failed: \(description)"
            case let .invalidSatusCode(statusCode):
                return "Invalid status code: \(statusCode)"
            case let .unknowError(error):
                return "An unknow error occured: \(error.localizedDescription)"
        }
    }
}
