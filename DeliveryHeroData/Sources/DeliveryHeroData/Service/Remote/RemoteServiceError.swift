//
//  RemoteServiceError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

enum RemoteServiceError: Error, LocalizedError {
    case invalidURL(path: String, queryItems: [String: String]?)

    var errorDescription: String? {
        switch self {
        case .invalidURL(let path, let queryItems):
            var message = "URL inválido: \(path)"
            
            if let queryItems = queryItems {
                message += " - (\(queryItems.debugDescription))"
            }
            
            message += "."
            
            return message
        }
    }
}
