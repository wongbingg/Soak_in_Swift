//
//  main.swift
//  ActorDemoCLT
//
//  Created by 이원빈 on 2022/12/28.
//

import Foundation

var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]

actor Test {
    var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    func pick() -> Int {
        return cards.removeFirst()
    }
}

let test = Test()

Task {
    for _ in 1...3 {
        let card = await test.pick()
        print("야곰: \(card) 카드를 뽑았습니다!")
    }
}

Task {
    for _ in 1...3 {
        let card = await test.pick()
        print("노루: \(card) 카드를 뽑았습니다!")
    }
}

Task {
    for _ in 1...3 {
        let card = await test.pick()
        print("오동나무: \(card) 카드를 뽑았습니다!")
    }
}

Thread.sleep(forTimeInterval: 4)

