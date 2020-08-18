//
//  DeliveryHeroDomainDI.swift
//  DeliveryHero
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import Foundation
import DeliveryHeroData
import DeliveryHeroDomain

struct DeliveryHeroDomainDI {

    // MARK: - Singleton

    static var shared = DeliveryHeroDomainDI()

    // MARK: - Init

    private init() { }
}

// MARK: - Services

private extension DeliveryHeroDomainDI {
    var apiRemoteService: RemoteService {
        return DeliveryHeroDataDI.shared.apiRemoteService
    }
}

// MARK: - UseCases

extension DeliveryHeroDomainDI {

    var fetchHeroesUseCase: FetchHeroesUseCase {
        return FetchHeroesUseCaseImpl(
            remoteRepository: RemoteFetchHeroesRepository(service: apiRemoteService))
    }
}
