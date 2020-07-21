//
//  FetchHeroesUseCase.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public protocol FetchHeroesUseCase {
    func execute(form: HeroFetchProfilesForm,
                 completion: @escaping (Result<[HeroProfile], Error>) -> Void)
}
