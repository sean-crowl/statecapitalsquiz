//
//  states.swift
//  StateCapitalQuiz
//
//  Created by Sean Crowl on 6/6/17.
//  Copyright © 2017 Interapt. All rights reserved.
//

import Foundation

class States {
    private var done: Bool = false
    private var currentInput: String = ""
    private var io = Io()
    
    var stateCapitals = ["Alabama":"Montgomery", "Alaska":"Juneau", "Arizona":"Phoenix", "Arkansas":"Little Rock", "California":"Sacramento", "Colorado":"Denver", "Connecticut":"Hartford", "Delaware":"Dover", "Florida":"Tallahassee", "Georgia":"Atlanta", "Hawaii":"Honolulu", "Idaho":"Boise", "Illinois":"Springfield", "Indiana":"Indianapolis", "Iowa":"Des Moines", "Kansas":"Topeka", "Kentucky":"Frankfort", "Louisiana":"Baton Rouge", "Maine":"Augusta", "Maryland":"Annapolis", "Massachusetts":"Boston", "Michigan":"Lansing", "Minnesota":"St. Paul", "Mississippi":"Jackson", "Missouri":"Jefferson City", "Montana":"Helena", "Nebraska":"Lincoln", "Nevada":"Carson City", "New Hampshire":"Concord", "New Jersey":"Trenton", "New Mexico":"Santa Fe", "New York":"Albany", "North Carolina":"Raleigh", "North Dakota":"Bismarck", "Ohio":"Columbus", "Oklahoma":"Oklahoma City", "Oregon":"Salem", "Pennsylvania":"Harrisburg", "Rhode Island":"Providence", "South Carolina":"Columbia", "South Dakota":"Pierre", "Tennessee":"Nashville", "Texas":"Austin", "Utah":"Salt Lake City", "Vermont":"Montpelier", "Virginia":"Richmond", "Washington":"Olympia", "West Virginia":"Charleston", "Wisconsin":"Madison", "Wyoming":"Cheyenne"]
    
    var correctCapitals:[String:String] = [:]
    
    var incorrectCapitals:[String:String] = [:]

}
