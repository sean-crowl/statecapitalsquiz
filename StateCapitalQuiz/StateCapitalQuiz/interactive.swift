//
//  interactive.swift
//  StateCapitalQuiz
//
//  Created by Sean Crowl on 6/6/17.
//  Copyright © 2017 Interapt. All rights reserved.
//

import Foundation

class Interactive {
    private var done: Bool = false
    private var currentInput: String = ""
    private var io = Io()
    private var state = States()
    
    func go() {
        while !done {
            io.writeMessage("\nWelcome to the state capitals quiz! This is a quiz where you guess the capital for each state! Type Start to begin or Quit to end.")
            currentInput = io.getInput()
            let selection = currentInput
            switch selection {
            case "Start":
                var capitalArray = state.stateCapitals.flatMap(){ $0.0 }
                
                while capitalArray.count > 0 {
                    let index: Int = Int(arc4random_uniform(UInt32(capitalArray.count)))
                    let key = capitalArray[index]
                    
                    print("\n\nWhat is the capital of: \n\n\(key) \n")
                    currentInput = io.getInput()
                    
                    if state.stateCapitals[key] == currentInput {
                        print("Correct!")
                        state.correctCapitals[key] = currentInput
                        capitalArray.remove(at: index)
                    } else {
                        print("Incorrect! \nThe capital of \(key) is: \(state.stateCapitals[key]!)")
                        state.incorrectCapitals[key] = state.stateCapitals[key]!
                        capitalArray.remove(at: index)
                    }
                }
                
                print("\n\nThe game is over! Here are the capitals you missed: \n\(state.incorrectCapitals) \n\nIf you would like to restart, type Restart. Type anything else to quit.")
                currentInput = io.getInput()
                if currentInput == "Yes" {
                    print("Restarting...\n")
                } else {
                    print("\nThank you for playing!")
                    done = true
                }
            case "Quit":
                print("\nThank you for playing!")
                done = true
            default:
                print("\nPlease make a selection!")
            }
        }
    }
    
}
