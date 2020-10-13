//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Zhenyuan Bo on 2020-10-12.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answerList: [String]
    let correctAnswer: String
    
    init(q: String, a:[String], correctAnswer: String){
        self.text = q
        self.answerList = a
        self.correctAnswer = correctAnswer
    }
}
