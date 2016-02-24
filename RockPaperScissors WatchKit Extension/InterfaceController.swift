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
    
    var playerChoice = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let pickerItems: [WKPickerItem] = Hands.types.map {
            (let hand) in
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = WKImage(imageName: "\(hand.rawValue).png")
            pickerItem.caption = hand.rawValue
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
    

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        print(segueIdentifier)
        if segueIdentifier == "gameResultSegue" {
            let computerChoice = Int(arc4random_uniform(3))
            print("Computer picked \(computerChoice)")
            let choices = ["player": playerChoice, "computer": computerChoice]
            return choices
        } else {
            return ["player": 0, "computer": 0]
        }
        
    }
    
    
}
