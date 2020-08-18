//
//  URLSessionRemoteServiceErrorTests.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import XCTest
@testable import DeliveryHeroData

final class URLSessionRemoteServiceErrorTests: XCTestCase {

    // MARK: - Tests

    func testDataIsNil() {
        let error = URLSessionRemoteServiceError.nullResult
        XCTAssertEqual(error.localizedDescription, "URLSessionRemoteServiceError.dataIsNil")
    }

    func testNetwork() {
        let mock = MockNetworkError.mock
        let error = URLSessionRemoteServiceError.network(mock)
        XCTAssertEqual(error.localizedDescription, "URLSessionRemoteServiceError.network mock.")
    }

    func testUnauthorized() {
        let error = URLSessionRemoteServiceError.unauthorized
        XCTAssertEqual(error.localizedDescription, "Credenciais invalidas.")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testDataIsNil", testDataIsNil),
        ("testNetwork", testNetwork),
        ("testUnauthorized", testUnauthorized)
    ]
}
