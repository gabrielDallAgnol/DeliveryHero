//
//  HeroesProfilesJSONTransform.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation
import DeliveryHeroDomain

struct HeroesProfilesJSONTransform: JSONToEntityTransform {
    typealias Entity = [HeroProfile]
    typealias JSON = MarvelWrapperJSON<MarvelContainerJSON<[HeroProfileJSON]>>

    var json: JSON
    
    func execute() throws -> Entity {
        var object: [HeroProfile] = []
        print(json)
        if let result = json.data?.results, !result.isEmpty {
            result.forEach {
                object.append(HeroProfile(descricao: $0.description ?? "",
                                          nome: $0.name ?? "",
                                          imagem: ($0.thumbnail?.path ?? "") + "." + ($0.thumbnail?.extensionString ?? "")))
            }
        } else {
            throw URLSessionRemoteServiceError.nullResult
        }

        return object
    }
}
