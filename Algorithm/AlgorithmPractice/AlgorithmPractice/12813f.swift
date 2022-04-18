// <12813> 이진수 연산
// BitMask 연습을 위한 문제

import Foundation

var testNumber = readLine()!
var binaryNum = Int(testNumber,radix: 2)!
var testNumber2 = readLine()!
var binaryNum2 = Int(testNumber2,radix: 2)!

var c1 = binaryNum & binaryNum2 //AND 연산
var c2 = binaryNum | binaryNum2 // OR 연산
var c3 = binaryNum ^ binaryNum2 // XOR 연산
var c4 = ~binaryNum // NOT 연산 --> 왜 "-" 부호가 붙어서 나오는걸까?
var c5 = binaryNum2 << 2 // SHIFT 연산

print(String(c1,radix: 2))
print(String(c2,radix: 2))
print(String(c3,radix: 2))
print(String(c4,radix: 2))
print(String(c5,radix: 2))


