//
//  JSONToEntityTransformErrorTests.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import XCTest
@testable import DeliveryHeroData

final class JSONToEntityTransformErrorTests: XCTestCase {

    // MARK: - Tests

    func testInvalidJSONDescription() {
        let error = JSONToEntityTransformError.invalidJSON
        XCTAssertEqual(error.localizedDescription, "JSONToEntityTransformError.invalidJSON.")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testInvalidJSONDescription", testInvalidJSONDescription)
    ]
}
