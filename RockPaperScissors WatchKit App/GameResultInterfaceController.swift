//
//  GameResultInterfaceController.swift
//  RockPaperScissors
//
//  Created by Nathan Fulkerson on 2/21/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import WatchKit
import Foundation


class GameResultInterfaceController: WKInterfaceController {

    
    @IBOutlet var playerChoiceImage: WKInterfaceImage!
    @IBOutlet var computerChoiceImage: WKInterfaceImage!
    @IBOutlet var gameResultLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.setTitle("Play Again")
        
        let player = (context as! NSDictionary)["player"] as? Int
        let computer = (context as! NSDictionary)["computer"] as? Int
        
        let playerHand = Hands.types[player!]
        let computerHand = Hands.types[computer!]
        
        // Configure interface objects here.
        playerChoiceImage.setImageNamed("\(playerHand.rawValue).png")
        computerChoiceImage.setImageNamed("\(computerHand.rawValue).png")
        
        showResults(playerHand, computer: computerHand)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func showResults(player: Hands, computer: Hands) {
        if player == computer {
            gameResultLabel.setText("It's a tie!")
            
        }
        else if (player == .Rock && computer == .Scissors) ||
            (player == .Scissors && computer == .Paper) ||
            (player == .Paper && computer == .Rock){
            gameResultLabel.setText("You win!")
        } else {
            gameResultLabel.setText("You lose!")
        }

    }
    

}
