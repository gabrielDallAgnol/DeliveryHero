//
//  MockDomainError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

enum MockDomainError: Error, LocalizedError {
    case mock(String)

    public var errorDescription: String? {
        switch self {
        case .mock(let value): return "\(value).error"
        }
    }
}
