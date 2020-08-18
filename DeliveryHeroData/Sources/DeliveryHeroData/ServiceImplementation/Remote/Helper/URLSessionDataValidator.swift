//
//  URLSessionDataValidator.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

struct URLSessionDataValidator {
    let response: RemoteServiceResponse

    func validData() throws -> Data {
        printDebugResponse()

        if (response.urlResponse as? HTTPURLResponse)?.statusCode == 401 {
            throw URLSessionRemoteServiceError.unauthorized
        }

        if let error = response.error {
            throw URLSessionRemoteServiceError.network(error)
        }

        if let data = response.data {
            return data
        }

        throw URLSessionRemoteServiceError.nullResult
    }

    private func printDebugResponse() {
        #if DEBUG
        print("")
        print("REQUEST -------------------------")
        let method = response.request.httpMethod.rawValue.uppercased()
        print("Method: \(method)")
        let urlPath = response.urlRequest?.url?.absoluteString ?? response.request.urlPath
        print("URL: \(urlPath)")
        print("RESPONSE ------------------------")
        let httpResponse = response.urlResponse as? HTTPURLResponse
        print("StatusCode: \(httpResponse?.statusCode ?? -1)")
        var error = "-"
        if let localized = response.error?.localizedDescription {
            error = localized
        }
        print("Error: \(error)")
        var dataString = "-"
        var dataCount = 0
        if let data = response.data {
            dataCount = data.count
            if let string = String(data: data, encoding: .utf8) {
                dataString = string
            }
        }
        print("Body: (\(dataCount)) \(dataString))")
        print("------------------------")
        print("")
        #endif
    }
}
