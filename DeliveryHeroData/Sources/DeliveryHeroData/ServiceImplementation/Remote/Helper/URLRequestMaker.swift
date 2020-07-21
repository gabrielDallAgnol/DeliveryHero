//
//  URLRequestMaker.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

let urlRegEx = "http[s]?://(([^/:.[:space:]]+(.[^/:.[:space:]]+)*)|([0-9](.[0-9]{3})))(:[0-9]+)?((/[^?#[:space:]]+)([^#[:space:]]+)?(#.+)?)?"

struct URLRequestMaker {
    static func make(request: RemoteServiceRequest) throws -> URLRequest {
        var urlRequest: URLRequest!
        var urlComponents = URLComponents(string: request.urlPath)

        if request.httpMethod == .get, let urlQueries = request.urlQueries, urlQueries.isEmpty == false {
            var queryItems: [URLQueryItem] = []

            urlQueries.forEach {
                let queryItem = URLQueryItem(name: $0.key, value: $0.value)
                queryItems.append(queryItem)
            }

            urlComponents?.queryItems = queryItems
        }


        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray: [urlRegEx])
        
        guard let url = urlComponents?.url, predicate.evaluate(with: url.absoluteString) else {
            throw RemoteServiceError.invalidURL(path: request.urlPath)
        }

        urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        return urlRequest
    }
}
