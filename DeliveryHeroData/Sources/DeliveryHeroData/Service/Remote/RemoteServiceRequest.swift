//
//  RemoteServiceRequest.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public struct RemoteServiceRequest: Equatable {
    let httpMethod: RemoteMethod
    let urlPath: String
    let urlQueries: [String: String]?
}
