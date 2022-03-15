//
//  XcTest_P_Tests.swift
//  XcTest<P>Tests
//
//  Created by 이원빈 on 2022/03/15.
//

import XCTest
@testable import XcTest_P_

class XcTest_P_Tests: XCTestCase {

    var calculator: Calculator!
    
    override func setUpWithError() throws {
        calculator = Calculator(with: 10)
    }

    override func tearDownWithError() throws {
        
    }
    
    func testMultiply() {
        calculator.multiply(by: 6)
        XCTAssertEqual(calculator.numberDescription, "The number is: 60")
    }
    
    func testDivide() {
        calculator.divide(by: 2)
        XCTAssertEqual(calculator.numberDescription, "The number is: 5")
    }
    
    

//    func testExample() throws {
//
//    }
//
//    func testPerformanceExample() throws {
//
//        self.measure {
//
//        }
//    }

}
