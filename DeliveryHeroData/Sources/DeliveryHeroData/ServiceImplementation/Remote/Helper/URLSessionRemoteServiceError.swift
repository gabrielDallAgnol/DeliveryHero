//
//  URLSessionRemoteServiceError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//
import Foundation

public enum URLSessionRemoteServiceError: Error, LocalizedError {
    case nullResult
    case network(Error)
    case unauthorized

    public var errorDescription: String? {
        switch self {
        case .nullResult: return "URLSessionRemoteServiceError.dataIsNil"
        case .network(let value): return "URLSessionRemoteServiceError.network \(value.localizedDescription)."
        case .unauthorized: return "Credenciais invalidas."
        }
    }
}
