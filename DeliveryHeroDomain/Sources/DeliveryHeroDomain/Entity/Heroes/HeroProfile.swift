//
//  HeroProfile.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public struct HeroProfile {
    public let descricao: String?
    public let nome: String?
    public let imagem: String?
    
    public init (descricao: String,
                 nome: String,
                 imagem: String) {
        self.descricao = descricao
        self.nome = nome
        self.imagem = imagem
    }
}
