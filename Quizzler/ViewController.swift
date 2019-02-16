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
    

    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        questionLabel.text = QuestionBank().list[number].questionText
        
        
    
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
        }else{
            print("Incorrect")
        }
        
        

        
    }
    
    
    func startOver() {
        number = 0
        nextQuestion()
       
    }
    


}

