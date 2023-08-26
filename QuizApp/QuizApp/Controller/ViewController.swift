//
//  ViewController.swift
//  QuizApp
//
//  Created by Arda Nar on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerButtonClicked(_ sender: Any) {
        
        let userAnswer = (sender as AnyObject).currentTitle!  // True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        //let actualAnswer = quiz[questionNumber].answer
       
        if let button = sender as? UIButton {
            if userGotItRight {
                button.backgroundColor = UIColor.green
            } else {
                button.backgroundColor = UIColor.red
            }
        }
        
        quizBrain.nextQuestion() // Çalışması için çağırmam gerekir
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        choice1Button.setTitle(answerChoices[0], for: .normal)
        choice2Button.setTitle(answerChoices[1], for: .normal)
        choice3Button.setTitle(answerChoices[2], for: .normal)
        
        
        progressBar.progress = quizBrain.getProgressBar()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        
        
        choice1Button.backgroundColor = .clear
        choice2Button.backgroundColor = .clear
        choice3Button.backgroundColor = .clear
        
        
    }
    
    override var shouldAutorotate: Bool {
            return false
        }
        
        override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait // veya istediğiniz yönlere uygun bir değer
        }
}

