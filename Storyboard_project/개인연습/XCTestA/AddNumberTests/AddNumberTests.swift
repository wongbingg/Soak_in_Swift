//
//  AddNumberTests.swift
//  AddNumberTests
//
//  Created by 이원빈 on 2022/03/16.
//

import XCTest
@testable import XCTestA

class AddNumberTests: XCTestCase {
    var sut:AddNumber!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AddNumber()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_addNumber호출시_1_2를입력했을때_3이출력되는지() {
        //given
        let a = 1
        let b = 2
        //when
        let result = sut.addNumber(a, b)
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_addOddNumberToList호출시_입력한숫자값이_배열에추가되는지() {
        //given
        let a = 1
        //when
        sut.addOddNumberToList(a)
        //then
        XCTAssertEqual(sut.list, [1])
    }
    
    func test_addOddNumberToList호출시_입력한_짝수숫자값이_배열에추가안되는지() {
        //given
        let a = 4
        //when
        sut.addOddNumberToList(a)
        //then
        XCTAssertEqual(sut.list, [])
    }
   

}
