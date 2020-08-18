//
//  File.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import XCTest
@testable import DeliveryHeroData

final class URLSessionJSONParserTests: XCTestCase {

    // MARK: - Mock

    struct Teste: Codable {
        var value: String
    }

    // MARK: - Tests

    func testSuccessParser() {
        let teste = Teste(value: "teste")
        let data = try! JSONEncoder().encode(teste)

        let json = try! URLSessionDataJSONParser(data: data).execute(Teste.self)
        XCTAssertEqual(json.value, teste.value)
    }

    func testFailParser() {
        XCTAssertThrowsError(try URLSessionDataJSONParser(data: Data()).execute(Teste.self))
    }

    // MARK: - All Tests

    static var allTests = [
        ("testSuccessParser", testSuccessParser),
        ("testFailParser", testFailParser)
    ]
}
