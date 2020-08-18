//
//  URLRequestMakerTests.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import XCTest
@testable import DeliveryHeroData

final class URLRequestMakerTests: XCTestCase {

    // MARK: - Tests

    func testMakeGetWithoutQuery() {
        let request = RemoteServiceRequest(httpMethod: .get,
                                           urlPath: "https://google.com",
                                           urlQueries: nil,
                                           httpHeader: [:])
        XCTAssertNoThrow(try URLRequestMaker.make(request: request))
    }

    func testMakeGetWithQuery() {
        let query = ["param1": "value1", "paramB": "valueB"]
        let request = RemoteServiceRequest(httpMethod: .get,
                                           urlPath: "https://google.com",
                                           urlQueries: query,
                                           httpHeader: [:])
        XCTAssertNoThrow(try URLRequestMaker.make(request: request))
    }

    func testMakeGetWithInvalidURL() {
        let query = ["param1": "value1", "paramB": "valueB"]
        let request = RemoteServiceRequest(httpMethod: .get,
                                           urlPath: "google",
                                           urlQueries: query,
                                           httpHeader: [:])
        XCTAssertThrowsError(try URLRequestMaker.make(request: request))
    }

    // MARK: - All Tests

    static var allTests = [
        ("testMakeGetWithoutQuery", testMakeGetWithoutQuery),
        ("testMakeGetWithQuery", testMakeGetWithQuery),
        ("testMakeGetWithInvalidURL", testMakeGetWithInvalidURL)
    ]
}
