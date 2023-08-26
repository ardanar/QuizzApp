//
//  Question.swift
//  QuizApp
//
//  Created by Arda Nar on 23.08.2023.
//

import Foundation

struct Question{
    let text: String
    let correctAnswer: String
    let answers: [String]
    
    init(q: String, correctAnswer: String, a: [String]){
        self.text = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
