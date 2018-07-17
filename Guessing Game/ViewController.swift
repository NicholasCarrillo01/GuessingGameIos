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
        
    submitButton.setTitle("submit", for: .normal)
    resetButton.setTitle("reset", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButtonTapped(_ sender: Any) {
        gameStatLabel.text = "you tapped the reset button"
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        gameStatLabel.text = "you tapped this button"
    }
    
    

}

