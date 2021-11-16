import XCTest
import Syntax
@testable import MathUI

final class MathUITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MathUI().text, "Hello, World!")
    }
    
    func testParsing() throws {
        try print(ExpressionParser().parse("1 + 2 * (1 + 2)"))
        try! ExpressionParser().parse("1 + 2 * (1 + 3)/(4 + 3)")
    }
}
