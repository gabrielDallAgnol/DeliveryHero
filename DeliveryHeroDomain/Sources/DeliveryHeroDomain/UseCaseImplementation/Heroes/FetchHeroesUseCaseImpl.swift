//
//  FetchHeroesUseCaseImpl.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public struct FetchHeroesUseCaseImpl: FetchHeroesUseCase {
    
    // MARK: - Init
    
    public init(remoteRepository: FetchHeroesRepository) {
        self.remoteRepository = remoteRepository
    }
    
    // MARK: - Property
    
    private let remoteRepository: FetchHeroesRepository
    
    // MARK: - Method
    
    public func execute(form: HeroFetchProfilesForm, completion: @escaping (Result<[HeroProfile], Error>) -> Void) {
        remoteRepository.execute(form: form) { result in
            switch result {
            case .success(let response):
                if response.isEmpty {
                    completion(.failure(HeroUseCaseError.invalidHeroesResponse))
                } else {
                    completion(.success(response))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
