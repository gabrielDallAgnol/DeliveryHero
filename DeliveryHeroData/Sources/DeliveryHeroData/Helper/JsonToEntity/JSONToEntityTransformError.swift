//
//  JSONToEntityTransformError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public enum JSONToEntityTransformError: Error, LocalizedError {
    case invalidJSON
    case errorMessage(String)

    public var errorDescription: String? {
        switch self {
        case .invalidJSON: return "JSONToEntityTransformError.invalidJSON."
        case .errorMessage(let value): return value
        }
    }
}
