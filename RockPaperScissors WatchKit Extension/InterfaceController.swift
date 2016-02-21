//
//  InterfaceController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by Nathan Fulkerson on 2/1/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var rpsPicker: WKInterfacePicker!
    
    var items: [(String, String)]! = [
        ("Rock.png", "Rock"),
        ("Scissors.png", "Scissors"),
        ("Paper.png", "Paper")
    ]
    
    var playerChoice = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let pickerItems: [WKPickerItem] = items.map {
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = WKImage(imageName: $0.0)
            pickerItem.caption = $0.1
            return pickerItem
        }
        
        rpsPicker.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func handPicked(value: Int) {
        print("\(value) picked.")
        playerChoice = value
    }
    
    @IBAction func shoot() {
        let computerChoice = Int(arc4random_uniform(3))
    
        if playerChoice == computerChoice {
            tieState()
        } else if playerChoice == 0 {
            if computerChoice == 1 {
                winState()
            } else {
                loseState()
            }
        } else if playerChoice == 1 {
            if computerChoice == 2 {
                winState()
            } else {
                loseState()
            }
        } else if playerChoice == 2 {
            if computerChoice == 0 {
                winState()
            } else {
                loseState()
            }
        }
    }
    
    let confirmAction = WKAlertAction(title: "Okay", style: .Default, handler: {})
    func winState() {
        presentAlertControllerWithTitle("You Win!", message: "Hooray!", preferredStyle: .Alert, actions: [confirmAction])
    }
    func loseState() {
        presentAlertControllerWithTitle("You Lose.", message: "Awww. :(", preferredStyle: .Alert, actions: [confirmAction])
    }
    func tieState() {
        presentAlertControllerWithTitle("Tie!", message: "It's a tie.", preferredStyle: .Alert, actions: [confirmAction])
    }
    
    
}
