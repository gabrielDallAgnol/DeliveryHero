//
//  FetchHeroesUseCaseImplTests.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import XCTest
@testable import DeliveryHeroDomain

final class FetchHeroesUseCaseImplTests: XCTestCase {
    
    // MARK: - Property
    let form = HeroFetchProfilesForm(limite: 20, deslocamento: 0, pesquisa: "aaa")
    
    // MARK: - Tests

    func testSucess() {
        let expectation = XCTestExpectation(description: "testSucess")
        let remoteRepository = MockFetchHeroesRepository(success: true)
        let useCase = FetchHeroesUseCaseImpl(remoteRepository: remoteRepository)

        useCase.execute(form: form) { result in
            if case .success(let value) = result {
                XCTAssertEqual(value.first?.nome, "aaa")
                XCTAssertEqual(value.first?.descricao, "aaa")
                XCTAssertEqual(value.count, 3)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.5)
    }
    
    func testNotsucceed() {
        let expectation = XCTestExpectation(description: "testNotsucceed")
        let remoteRepository = MockFetchHeroesRepository(success: false)
        let useCase = FetchHeroesUseCaseImpl(remoteRepository: remoteRepository)
        
        useCase.execute(form: form) { result in
            if case .failure(let error) = result, let useCaseError = error as? HeroUseCaseError {
                XCTAssertEqual(useCaseError, .invalidHeroesResponse)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testFailNetwork() {
        let expectation = XCTestExpectation(description: "testFailNetwork")
        let remoteRepository = MockFetchHeroesRepository(success: nil)
        let useCase = FetchHeroesUseCaseImpl(remoteRepository: remoteRepository)

        useCase.execute(form: form) { result in
            if case .failure(let error) = result {
                XCTAssertEqual(error.localizedDescription, "MockFetchHeroesRepository.error")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.5)
    }

    // MARK: - All Tests

    static var allTests = [
        ("testSucess", testSucess),
        ("testNotsucceed", testNotsucceed),
        ("testFailNetwork", testFailNetwork)
    ]
    
}

