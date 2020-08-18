//
//  MockNetworkError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import Foundation

enum MockNetworkError: Error, LocalizedError {
    case mock

    public var errorDescription: String? {
        switch self {
        case .mock: return "mock"
        }
    }
}
