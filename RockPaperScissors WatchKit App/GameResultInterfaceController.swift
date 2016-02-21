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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    

}
