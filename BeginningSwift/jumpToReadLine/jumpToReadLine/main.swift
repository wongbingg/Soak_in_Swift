//
//  main.swift
//  jumpToReadLine
//
//  Created by 이원빈 on 2022/03/10.
//

import Foundation


let input = readLine()!

var nfc = input.precomposedStringWithCanonicalMapping
var nfkc = input.precomposedStringWithCompatibilityMapping

print(nfc)
print(nfkc)


var text = "이원빈"
print(text)
