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

final class DeliveryHeroData {
    
    // MARK: - Singleton

    static var shared = DeliveryHeroData()

    // MARK: - Init

    private init() {
    }
    
    // MARK: - Properties
    
    var apiRemoteService: RemoteService!
    
}

// MARK: - Setup

private extension DeliveryHeroData {

    func setupApiRemoteService() {
        let session = URLSession.shared
        let rootPath = "https://gateway.marvel.com:443/v1/public/"
        let publicKey = "5ce5f54559949f6fac99f814e848014f"
        let privateKey = "8cfd8487432e4b3062303ebe217b08547073bcd6"
        let timestamp = Date().timeIntervalSince1970.description
        var hash: String {
                let string = timestamp + privateKey + publicKey
                return string.md5
            }

        apiRemoteService = URLSessionRemoteService(session: session,
                                                   rootPath: rootPath,
                                                   authParam: ["apikey": publicKey,
                                                               "ts": timestamp,
                                                               "hash": "application/json"])
    }
}
