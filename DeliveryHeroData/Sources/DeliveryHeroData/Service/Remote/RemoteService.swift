//
//  RemoteService.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

public protocol RemoteService {
    var rootPath: String { get }
    var authParam: [String: String] { get }

    func execute(httpMethod: RemoteMethod,
                 apiPath: String,
                 urlQueries: [String: String]?,
                 onCompletion: @escaping (RemoteServiceResponse) -> Void)
}
