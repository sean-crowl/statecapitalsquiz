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
                let index: Int = Int(arc4random_uniform(UInt32(state.stateCapitals.count)))
                let key = Array(state.stateCapitals.keys)[index]
                if !state.correctCapitals.keys.contains(state.stateCapitals[key]!) && !state.correctCapitals.keys.contains(state.stateCapitals[key]!) {
                    print("What is the capital of: \n\n\(state.stateCapitals[key]!) \n")
                }
                currentInput = io.getInput()
                if state.stateCapitals.keys.contains(currentInput) {
                    print("Correct!")
                    state.correctCapitals[state.stateCapitals[key]!] = currentInput
                    print(state.correctCapitals)
                } else {
                    print("Incorrect!")
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
