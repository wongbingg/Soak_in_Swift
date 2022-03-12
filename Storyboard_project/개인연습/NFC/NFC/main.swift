//
//  main.swift
//  NFC
//
//  Created by 이원빈 on 2022/03/09.
//

import Foundation
//
//let precomposed: Character = "\u{D55C}"
//let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
//
//print("\(precomposed)\n \(decomposed)")


let string = "ㅇㅣㅇㅜㅓㄴㅂㅣㄴ"

for i in string.utf8 {
    print(i)
}
