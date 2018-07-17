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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    randomNumber = Int(arc4random_uniform(101)) //typecasting the UInt32 that arc4random_uniform() returns to an int
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
        
    
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        //this creates a  new constant by atempting to convert what the user has entered into the guesstextfield to an int. if it cant, we break out of the function
        guard let userGuess = Int(guessTextfield.text!) else {
            return
        }
        //check to make sure that the number the user put is between 0 and 100. break out ogf the function if it isnt
        
        if userGuess < 0 || userGuess > 100 {
            return
        }
        if userGuess == randomNumber {
            gameStatLabel.text = "Correct! you won!"
        } else if userGuess < randomNumber {
            gameStatLabel.text = "your guess was too low"
        } else {
            gameStatLabel.text = "your guess was to high"
        }
}
    
    

}

