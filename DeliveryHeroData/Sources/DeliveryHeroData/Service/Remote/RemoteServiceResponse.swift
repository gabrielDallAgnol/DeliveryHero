//
//  RemoteServiceResponse.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public struct RemoteServiceResponse {
    let data: Data?
    let error: Error?
    let urlResponse: URLResponse?
    let request: RemoteServiceRequest
    let urlRequest: URLRequest?
}
