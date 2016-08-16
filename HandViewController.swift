//
//  HandViewController.swift
//  RockPaperScissors
//
//  Created by Nathan Fulkerson on 7/27/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit

class HandViewController: UIViewController {
    var choices: Choices? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rockSelected" {
            choices = getChoices(.Rock)
        } else if segue.identifier == "paperSelected" {
            choices = getChoices(.Paper)
        } else if segue.identifier == "scissorsSelected" {
            choices = getChoices(.Scissors)
        }
        if let destinationViewController = segue.destinationViewController as? ResultsViewController {
            destinationViewController.choices = choices
        }
    }
    
    func getChoices(player:Hands) -> Choices {
        let computerChoice = Int(arc4random_uniform(3))
        let aiHand = Hands.types[computerChoice]
        print("Computer picked \(aiHand)")
        let choices = Choices(playerChoice: player, aiChoice: aiHand)
        return choices

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
