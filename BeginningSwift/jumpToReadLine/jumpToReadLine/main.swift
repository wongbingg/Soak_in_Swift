//
//  main.swift
//  jumpToReadLine
//
//  Created by 이원빈 on 2022/03/10.
//

import Foundation

let input = readLine()
if let input = input {
    let mappingInput = input.precomposedStringWithCompatibilityMapping
    print(input)
    print(mappingInput)
}



