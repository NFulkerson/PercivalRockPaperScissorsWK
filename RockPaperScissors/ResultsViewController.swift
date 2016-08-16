//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Nathan Fulkerson on 7/27/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var playerChoiceImage: UIImageView!
    @IBOutlet weak var aiChoiceImage: UIImageView!
    @IBOutlet weak var gameResultLabel: UILabel!
    var choices: Choices?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let playerHand = choices?.playerChoice
        let aiHand = choices?.aiChoice
        playerChoiceImage.image = UIImage(named:"\(playerHand!.rawValue).png")
        aiChoiceImage.image = UIImage(named:"\(aiHand!.rawValue).png")
        showResults(playerHand!, computer: aiHand!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showResults(player: Hands, computer: Hands) {
        if player == computer {
            gameResultLabel.text = "It's a tie!"
            
        }
        else if (player == .Rock && computer == .Scissors) ||
            (player == .Scissors && computer == .Paper) ||
            (player == .Paper && computer == .Rock){
            gameResultLabel.text = "You win!"
        } else {
            gameResultLabel.text = "You lose!"
        }
        
    }
    
}
