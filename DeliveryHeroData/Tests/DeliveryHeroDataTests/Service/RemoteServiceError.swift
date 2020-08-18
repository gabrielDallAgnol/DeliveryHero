//
//  RemoteServiceError.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import XCTest
@testable import DeliveryHeroData

final class RemoteServiceErrorTests: XCTestCase {

    // MARK: - Tests
    
    func testInvalidUrl() {
        let error = RemoteServiceError.invalidURL(path: "google", queryItems: nil)
        XCTAssertEqual(error.localizedDescription, "URL inválido: google.")
    }

    func testInvalidUrlWithQuery() {
        let error = RemoteServiceError.invalidURL(path: "google", queryItems: ["paramA": "valueA"])
        XCTAssertEqual(error.localizedDescription, "URL inválido: google - ([\"paramA\": \"valueA\"]).")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testInvalidUrl", testInvalidUrl),
        ("testInvalidUrlWithQuery", testInvalidUrlWithQuery)
    ]
}
