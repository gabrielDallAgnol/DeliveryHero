//
//  RemoteFetchHeroesRepository.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation
import DeliveryHeroDomain

public struct RemoteFetchHeroesRepository: FetchHeroesRepository {

    // MARK: - Init

    public init(service: RemoteService) {
        self.service = service
    }

    // MARK: - Property

    let service: RemoteService

    // MARK: - Method

    public func execute(form: HeroFetchProfilesForm,
                        completion: @escaping (Result<[HeroProfile], Error>) -> Void) {
        let apiPath = "v1/public/characters"
        var parameters: [String: String] = [
            "offset": form.deslocamento.description,
            "limit": form.limite.description,
            "nameStartsWith": form.pesquisa
        ]
        
        if parameters["nameStartsWith"]?.isEmpty ?? true {
            parameters.removeValue(forKey: "nameStartsWith")
        }
        
        service.execute(
            httpMethod: .get,
            apiPath: apiPath,
            urlQueries: parameters
        ) { response in
            var object: [HeroProfile]

            do {
                let data = try URLSessionDataValidator(response: response).validData()
                let parser = URLSessionDataJSONParser(data: data)
                let json = try parser.execute(MarvelWrapperJSON<MarvelContainerJSON<[HeroProfileJSON]>>.self)
                object = try HeroesProfilesJSONTransform(json: json).execute()

            } catch {
                completion(.failure(error))
                return
            }

            completion(.success(object))
        }
    }
}
