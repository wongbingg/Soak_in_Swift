//
//  main.swift
//  Algorithm
//
//  Created by 이원빈 on 2021/12/25.
//
import Foundation
let a = readLine()!.components(separatedBy: " ").map{Int($0)!}

var A:Int = (a[0] * (a[1] % 10))
var B:Int = (a[0] * ((a[1] % 100)/10))
var C:Int = (a[0] * (a[1] / 100))
var D:Int = (a[0] * a[1])

print(A)
print(B)
print(C)
print(D)
