//
//  HeroProfile.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public struct HeroProfile {
    public var descricao: String?
    public var nome: String?
    public var imagem: String?
    
    public init (descricao: String,
                 nome: String,
                 imagem: String) {
        self.descricao = descricao
        self.nome = nome
        self.imagem = imagem
    }
}
