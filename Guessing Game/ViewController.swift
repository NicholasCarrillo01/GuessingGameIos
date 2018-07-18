//
//  ViewController.swift
//  Guessing Game
//
//  Created by Nichilas Carrillo on 7/16/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessTextfield: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var gameStatLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    var randomNumber: Int!
    var attempts = 5
    
    @IBOutlet weak var attemptsRemainingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber = Int(arc4random_uniform(101)) //typecasting the UInt32 that arc4random_uniform() returns to an int
        attemptsRemainingLabel.text = "5"
        
        
        gameStatLabel.text = "\(randomNumber!)"
        gameStatLabel.text = "good luck"
        submitButton.setTitle("submit", for: .normal)
        resetButton.setTitle("reset", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        gameStatLabel.text = "Good luck"
        randomNumber = Int(arc4random_uniform(101))
        guessTextfield.text = ""
        submitButton.isEnabled = true
        //reset the number of attempts
        attempts = 5
        attemptsRemainingLabel.text = "5"
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        //this creates a  new constant by atempting to convert what the user has entered into the guesstextfield to an int. if it cant, we break out of the function
        guard let userGuess = Int(guessTextfield.text!) else {
            return
        }
        
        attempts -= 1
        
        //check to make sure that the number the user put is between 0 and 100. break out ogf the function if it isnt
        attemptsRemainingLabel.text = "\(attempts)"
        
        guessTextfield.text = ""
        
        if userGuess < 0 || userGuess > 100 {
            return
        }
        
        if attempts > 0 {
            //check to see if the user has guessed the random number, or is too high or low
            if userGuess == randomNumber {
                gameStatLabel.text = "Correct! you won!"
            } else if userGuess < randomNumber {
                gameStatLabel.text = "your guess was too low"
            } else {
                gameStatLabel.text = "your guess was to high"
            }
        } else {
            gameStatLabel.text = "You lose! The correct number was \(randomNumber!). Try again"
            //disable the submit button so the user can tkeep entering guessing
            submitButton.isEnabled = false
        }
        
    }
    
    
    
}

