//
//  AddNumber.swift
//  XCTestA
//
//  Created by 이원빈 on 2022/03/16.
//

import Foundation

struct AddNumber {
    var list:[Int] = []
    
    mutating func addOddNumberToList(_ num:Int) {
        if num % 2 == 1 {
            list.append(num)
        }

    }
    
    func addNumber(_ a:Int,_ b:Int) -> Int {
        return a + b
    }
}
