//
//  URLSessionDataJSONParser.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

struct URLSessionDataJSONParser {
    let data: Data

    func execute<T: Decodable>(_ jsonType: T.Type) throws -> T {
        var decodedJson: T!

        do {
            decodedJson = try JSONDecoder().decode(jsonType.self, from: data)
        } catch {
            print(error)
            throw error
        }

        return decodedJson
    }
}
