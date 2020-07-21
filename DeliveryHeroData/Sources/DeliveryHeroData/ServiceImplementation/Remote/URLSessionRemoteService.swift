//
//  URLSessionRemoteService.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation



public struct URLSessionRemoteService: RemoteService {
    
    // MARK: - Init
    
    public init(session: URLSession,
                rootPath: String,
                authParam: [String: String]) {
        self.session = session
        self.rootPath = rootPath
        self.authParam = authParam
    }
    
    // MARK: - Property
    
    var session: URLSession
    
    // MARK: - Protocol
    
    public let rootPath: String
    public let authParam: [String: String]
    
    public func execute(httpMethod: RemoteMethod,
                        apiPath: String,
                        urlQueries: [String: String]?,
                        onCompletion: @escaping (RemoteServiceResponse) -> Void) {
        
        var queries = urlQueries
        
        authParam.forEach {
            queries?.updateValue($0.key, forKey: $0.value)
        }
        
        let request = RemoteServiceRequest(httpMethod: httpMethod,
                                           urlPath: rootPath + apiPath,
                                           urlQueries: queries)
        
        var urlRequest: URLRequest!
        
        do {
            urlRequest = try URLRequestMaker.make(request: request)
        } catch {
            let response = RemoteServiceResponse(data: nil,
                                                 error: error,
                                                 urlResponse: nil,
                                                 request: request,
                                                 urlRequest: nil)
            onCompletion(response)
            return
        }
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            let response = RemoteServiceResponse(data: data,
                                                 error: error,
                                                 urlResponse: response,
                                                 request: request,
                                                 urlRequest: urlRequest)
            onCompletion(response)
        }
        
        task.resume()
    }
}



