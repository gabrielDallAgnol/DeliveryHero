//
//  URLSessionDataValidatorTests.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import XCTest
@testable import DeliveryHeroData

final class URLSessionDataValidatorTests: XCTestCase {

    // MARK: - Property

    private let request = RemoteServiceRequest(httpMethod: .get,
                                               urlPath: "",
                                               urlQueries: nil,
                                               httpHeader: [:])

    // MARK: - Mock

    struct Teste: Codable {
        var value: String
    }

    // MARK: - Tests

    func testSuccess() {
        let response = RemoteServiceResponse(data: Data(),
                                             error: nil,
                                             urlResponse: nil,
                                             request: request,
                                             urlRequest: nil)
        XCTAssertNoThrow(try URLSessionDataValidator(response: response).validData())
    }

    func testFailNetwork() {
        let response = RemoteServiceResponse(data: nil,
                                             error: MockNetworkError.mock,
                                             urlResponse: nil,
                                             request: request,
                                             urlRequest: nil)
        do {
            let _ = try URLSessionDataValidator(response: response).validData()
        } catch {
            XCTAssertEqual(error.localizedDescription, "URLSessionRemoteServiceError.network mock.")
        }
    }

    func testFailData() {
        let response = RemoteServiceResponse(data: nil,
                                             error: nil,
                                             urlResponse: nil,
                                             request: request,
                                             urlRequest: nil)
        do {
            let _ = try URLSessionDataValidator(response: response).validData()
        } catch {
            XCTAssertEqual(error.localizedDescription, "URLSessionRemoteServiceError.dataIsNil")
        }
    }

    func testFailUnauthorizezd() {
        let urlResponse = HTTPURLResponse(url: URL(string: "http://google.com")!,
                                          statusCode: 401,
                                          httpVersion: nil,
                                          headerFields: nil)
        let response = RemoteServiceResponse(data: nil,
                                             error: nil,
                                             urlResponse: urlResponse,
                                             request: request,
                                             urlRequest: nil)
        do {
            let _ = try URLSessionDataValidator(response: response).validData()
        } catch {
            XCTAssertEqual(error.localizedDescription,
                           URLSessionRemoteServiceError.unauthorized.localizedDescription)
        }
    }

    // MARK: - All Tests

    static var allTests = [
        ("testSuccess", testSuccess),
        ("testFailNetwork", testFailNetwork),
        ("testFailData", testFailData),
        ("testFailUnauthorizezd", testFailUnauthorizezd)
    ]
}
