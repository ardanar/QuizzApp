//
//  QuizBrain.swift
//  QuizApp
//
//  Created by Arda Nar on 24.08.2023.
//

import Foundation

struct QuizBrain{
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", correctAnswer: "Skin", a: ["Heart", "Skin", "Large Intestine"]),
        Question(q: "Five dollars is worth how many nickels?", correctAnswer: "100", a: ["25", "50", "100"]),
        Question(q: "What do the letters in the GMT time zone stand for?", correctAnswer: "Greenwich Mean Time", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"]),
        Question(q: "What is the French word for 'hat'?", correctAnswer: "Chapeau", a: ["Chapeau", "Écharpe", "Bonnet"]),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", correctAnswer: "Watch", a: ["Notebook", "Handkerchief", "Watch"]),
        Question(q: "How would one say goodbye in Spanish?", correctAnswer: "Adiós", a: ["Au Revoir", "Adiós", "Salir"]),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", correctAnswer: "Orange", a: ["Green", "Orange", "Blue"]),
        Question(q: "What alcoholic drink is made from molasses?", correctAnswer: "Rum", a: ["Rum", "Whisky", "Gin"]),
        Question(q: "What type of animal was Harambe?", correctAnswer: "Gorilla", a: ["Panda", "Gorilla", "Crocodile"]),
        Question(q: "Where is Tasmania located?", correctAnswer: "Australia", a: ["Indonesia", "Australia", "Scotland"])
    ]
    
    var questionNumber = 0   // Kullanıcı hangi soruda olduğunu öğrenmek için
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        
        if userAnswer == quiz[questionNumber].correctAnswer{
            score += 1
            return true
        }else{
            return false
        }
        
    }
    
    func getQuestionText() -> String{
        
        return quiz[questionNumber].text
    }
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgressBar() -> Float{
        return Float(questionNumber) / Float(quiz.count)
    }
    
    // Struct içerisinde olduğu için değerler değişmez. Class olsaydı mutating eklemek gerekmezdi.
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        }else{
            // Yeniden başladığında sıfırlansın
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int{
        return score
    }
    
}

