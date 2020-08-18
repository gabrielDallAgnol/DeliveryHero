//
//  HeroUseCaseError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public enum HeroUseCaseError: Error, LocalizedError {
    case invalidHeroesResponse
    
    public var errorDescription: String? {
        switch self {
        case .invalidHeroesResponse: return "Não foi possivel encontrar heróis. Tente Novamente"
        }
    }
}
