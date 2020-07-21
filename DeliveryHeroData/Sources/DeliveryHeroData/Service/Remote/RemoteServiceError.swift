//
//  RemoteServiceError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

enum RemoteServiceError: Error, LocalizedError {
    case invalidURL(path: String)

    var errorDescription: String? {
        switch self {
        case .invalidURL(let path):
            return "URL inválido: \(path)"
        }
    }
}
