//
//  HeroUseCaseErrorTests.HeroUseCaseErrorTests
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import XCTest
@testable import DeliveryHeroDomain

final class HeroUseCaseErrorTests: XCTestCase {
    
    // MARK: - Tests
    
    func testValidDescription() {
        XCTAssertEqual(HeroUseCaseError.invalidHeroesResponse.localizedDescription,
                       "Não foi possivel encontrar heróis. Tente Novamente")
    }
    
    // MARK: - All Tests
    
    static var allTests = [
        ("testValidDescription", testValidDescription)
    ]
}

