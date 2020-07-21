import XCTest
@testable import UICore

final class UICoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UICore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
