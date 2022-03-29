//
//  testappTests.swift
//  testappTests
//
//  Created by 이원빈 on 2022/03/15.
//

import XCTest
@testable import testapp

class testappTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArraySorting() {
        let input = [1,7,6,3,10]
        let expectation = [1,3,6,7,10]
        
        let result = input.sorted()
        
        XCTAssertEqual(result, expectation)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
