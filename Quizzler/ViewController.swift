//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    var pickedAnswer: Bool = false
    var score: Int = 0
    

    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        questionLabel.text = QuestionBank().list[number].questionText
        scoreLabel.text = "Score : 0"
        progressLabel.text = "1/13"
        
        
    
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        } else{
            pickedAnswer = false
        }
        
        checkAnswer()
        number += 1
        
        nextQuestion()
       
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(number+2)/13"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(number+1)
        
        
        
    }
    
    

    func nextQuestion() {
        if number<=12{
            questionLabel.text = QuestionBank().list[number].questionText
        }else{
            let alert = UIAlertController(title: "Awesome"
                , message: "Game Over. Repeat over."
                , preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart"
            , style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert,animated: true,completion: nil)
            
        }
        
        
    }
    
    
    func checkAnswer() {
        
        
        if pickedAnswer == QuestionBank().list[number].answer {
            print("Correct")
            score += 1
            updateUI()
        }else{
            print("Incorrect")
            updateUI()
        }
        
        

        
    }
    
    
    func startOver() {
        number = 0
        score = 0
        updateUI()
        nextQuestion()
       
    }
    


}

