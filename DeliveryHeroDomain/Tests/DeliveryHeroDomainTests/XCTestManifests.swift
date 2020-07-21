import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DeliveryHeroDomainTests.allTests),
    ]
}
#endif
