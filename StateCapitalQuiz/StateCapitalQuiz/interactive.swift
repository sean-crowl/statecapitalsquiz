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
            //Accept input to begin or quit game
            io.writeMessage("\nWelcome to the state capitals quiz! This is a quiz where you guess the capital for each state! Type Start to begin or Quit to end.")
            currentInput = io.getInput()
            let selection = currentInput
            //Set up cases for possible inputs
            switch selection {
            case "Start":
                //Make sure dictionaries of correct and incorrect answers are empty for new game
                state.correctCapitals = [:]
                state.incorrectCapitals = [:]
                //Map states from dictionary to an array for easier handling
                var stateArray = state.stateCapitals.flatMap(){ $0.0 }
                //As long as array of states contains more than zero elements, repeat question
                while stateArray.count > 0 {
                    //Gets random index number to get random state from array
                    let index: Int = Int(arc4random_uniform(UInt32(stateArray.count)))
                    let key = stateArray[index]
                    //Ask for capital of random state selected
                    print("\nWhat is the capital of: \n\(key) \n")
                    currentInput = io.getInput()
                    //Set up for correct or incorrect answer
                    if state.stateCapitals[key] == currentInput {
                        print("Correct!")
                        //Add correctly guessed state and capital to dictionary of correct answers
                        state.correctCapitals[key] = currentInput
                        //Remove state from array so that it will not be repeated
                        stateArray.remove(at: index)
                    } else {
                        print("Incorrect! \nThe capital of \(key) is: \(state.stateCapitals[key]!)")
                        //Add state and correct capital to dictionary of incorrect answers
                        state.incorrectCapitals[key] = state.stateCapitals[key]!
                        //Remove state from array so that it will not be repeated
                        stateArray.remove(at: index)
                    }
                }
                
                print("\n\nThe game is over!")
                //Set up for end of game scoring and answers
                print("\nYou got \(state.correctCapitals.count) out of \(state.stateCapitals.count) correct!")
                //Divides amount of correct answers by amount of total questions to get percent, then checks to see where percent falls to display correct score and grade.
                if (state.correctCapitals.count*100) / state.stateCapitals.count >= 90 {
                    print("\nYou scored a \((state.correctCapitals.count*100) / state.stateCapitals.count)%! Your grade is an A!")
                } else if (state.correctCapitals.count*100) / state.stateCapitals.count < 90 && (state.correctCapitals.count*100) / state.stateCapitals.count >= 80 {
                    print("\nYou scored a \((state.correctCapitals.count*100) / state.stateCapitals.count)%! Your grade is a B!")
                } else if (state.correctCapitals.count*100) / state.stateCapitals.count < 80 && (state.correctCapitals.count*100) / state.stateCapitals.count >= 70 {
                    print("\nYou scored a \((state.correctCapitals.count*100) / state.stateCapitals.count)%! Your grade is a C!")
                } else if (state.correctCapitals.count*100) / state.stateCapitals.count < 70 && (state.correctCapitals.count*100) / state.stateCapitals.count >= 60 {
                    print("\nYou scored a \((state.correctCapitals.count*100) / state.stateCapitals.count)%! Your grade is an D!")
                } else {
                    print("\nYou scored a \((state.correctCapitals.count*100) / state.stateCapitals.count)%! Your grade is an F!")
                }
                //Displays dictionary of capitals that were guessed incorrectly with correct answers  then gives choice to restart game or quit.
                print("\nHere are the capitals you missed: \n\(state.incorrectCapitals) \n\nIf you would like to restart, type Restart. Type anything else to quit.")
                currentInput = io.getInput()
                if currentInput == "Restart" {
                    print("Restarting...\n")
                } else {
                    print("\nThank you for playing!")
                    //Ends program
                    done = true
                }
            case "Quit":
                print("\nThank you for playing!")
                //Ends program
                done = true
            default:
                print("\nPlease make a selection!")
            }
        }
    }
    
}
