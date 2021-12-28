//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 이원빈 on 2021/12/27.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a:[String] , c:String) {
        text = q
        answer = a
        correctAnswer = c
    }
}
