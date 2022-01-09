//
//  main.swift
//  AlgorithmPractice
//
//  Created by 이원빈 on 2022/01/09.
//

import Foundation

var firstNum = Int(readLine()!)!
var secondNum = Int(readLine()!)!


let a1 = secondNum % 10
let a2 = (secondNum % 100) / 10
let a3 = secondNum / 100

print(a1 * firstNum)
print(a2 * firstNum)
print(a3 * firstNum)
print((a1 * firstNum) + (a2 * firstNum) * 10 + (a3 * firstNum) * 100)

