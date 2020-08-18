//
//  File.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 22/07/20.
//

import DeliveryHeroDomain
@testable import DeliveryHeroData
import XCTest

class HeroesProfilesJSONTransformTests: XCTestCase {
    
    // MARK: - Tests
    
    func test() {
        let heroes = [
            HeroProfileJSON(description: "aaa",id: 1, name: "bbb",
                            thumbnail: HeroThumbnailJSON(path: "www.aaa", extensionString: "jpg")),
            HeroProfileJSON(description: "eee",id: 2, name: "fff",
                            thumbnail: HeroThumbnailJSON(path: "www.eee", extensionString: "jpg")),
            HeroProfileJSON(description: "hhh",id: 3, name: "iii",
                            thumbnail: HeroThumbnailJSON(path: "www.hhh", extensionString: "jpg"))]

        let containerJson = MarvelContainerJSON(results: heroes,
                                                offset: nil,
                                                limit: nil,
                                                total: nil,
                                                count: nil)
        
        let wrapperJson = MarvelWrapperJSON(data: containerJson, status: nil)
        let transform = HeroesProfilesJSONTransform(json: wrapperJson)
        let transformed = try! transform.execute()
        
        for (index, element) in transformed.enumerated() {
            XCTAssertEqual(element.descricao, heroes[index].description)
            XCTAssertEqual(element.nome, heroes[index].name)
            XCTAssertEqual(element.imagem,
                           (heroes[index].thumbnail?.path ?? "")
                            + "."
                            + (heroes[index].thumbnail?.extensionString ?? ""))
        }
        XCTAssertNoThrow(try transform.execute())
    }
    
    func testFail() {
        let heroes:[HeroProfileJSON] = []

        let containerJson = MarvelContainerJSON(results: heroes,
                                                offset: nil,
                                                limit: nil,
                                                total: nil,
                                                count: nil)
        
        let wrapperJson = MarvelWrapperJSON(data: containerJson, status: nil)
        let transform = HeroesProfilesJSONTransform(json: wrapperJson)
        
        XCTAssertThrowsError(try transform.execute())
    }
    // MARK: - All Tests

    static var allTests = [
        ("test", test),
        ("testFail", testFail)
    ]
}
