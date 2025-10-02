//
//  NetworkError.swift
//  AssignmentBattlebucks
//  AssignmentBattlebucks
//  Created by Praveen Verma on 10/2/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestFailed: return "Network request failed"
        case .decodingError: return "Failed to decode response"
        }
    }
}
