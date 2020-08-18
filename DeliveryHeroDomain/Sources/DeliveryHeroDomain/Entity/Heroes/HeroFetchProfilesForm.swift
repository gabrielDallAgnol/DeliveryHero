//
//  HeroFetchProfilesForm.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public struct HeroFetchProfilesForm {
    public let limite: Int
    public let deslocamento: Int
    public let pesquisa: String
    
    public init (limite: Int,
                 deslocamento: Int,
                 pesquisa: String) {
        self.limite = limite
        self.deslocamento = deslocamento
        self.pesquisa = pesquisa
    }
}
