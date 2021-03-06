//
//  DeliveryHeroData.swift
//  DeliveryHero
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import Foundation
import DeliveryHeroData
//import Kingfisher

final class DeliveryHeroDataDI {
    
    // MARK: - Singleton

    static var shared = DeliveryHeroDataDI()

    // MARK: - Init

    private init() {
        setupApiRemoteService()
    }
    
    // MARK: - Properties
    
    var apiRemoteService: RemoteService!
    
}

// MARK: - Setup

private extension DeliveryHeroDataDI {

    func setupApiRemoteService() {
        let session = URLSession.shared
        let rootPath = "https://gateway.marvel.com:443/"
        let publicKey = "5ce5f54559949f6fac99f814e848014f"
        let privateKey = "8cfd8487432e4b3062303ebe217b08547073bcd6"
        let timestamp = Date().timeIntervalSince1970.description
        var hash: String {
                let string = timestamp + privateKey + publicKey
                return string.md5
            }

        apiRemoteService = URLSessionRemoteService(session: session,
                                                   rootPath: rootPath,
                                                   httpHeader: ["Content-Type": "application/json"],
                                                   authParam: ["apikey": publicKey,
                                                               "ts": timestamp,
                                                               "hash": hash])
    }
}
