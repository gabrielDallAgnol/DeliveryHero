import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        
        // UseCaseImplementation - Hero - Error
        
        testCase(HeroUseCaseErrorTests.allTests),

        // UseCaseImplementation - Hero

        testCase(FetchHeroesUseCaseImplTests.allTests),
    ]
}
#endif
