//
//  MockFetchHeroesRepository.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation
@testable import DeliveryHeroDomain

struct MockFetchHeroesRepository: FetchHeroesRepository {
    let success: Bool?
    
    func execute(form: HeroFetchProfilesForm, completion: @escaping (Result<[HeroProfile], Error>) -> Void) {
        
        let heroes = [HeroProfile(descricao: "aaa", nome: "aaa", imagem: "aaa"),
                      HeroProfile(descricao: "bbb", nome: "bbb", imagem: "bbb"),
                      HeroProfile(descricao: "ccc", nome: "ccc", imagem: "ccc")]
        
        if let isSuccess = success {
            if isSuccess {
                completion(.success(heroes))
                return
            } else {
                completion(.success([]))
            }
        } else {
            completion(.failure(MockDomainError.mock("MockFetchHeroesRepository")))
        }
        
        
    }
}

