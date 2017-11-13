//
//  Team.swift
//  Projet 3
//
//  Created by Mac Hack on 31/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

//Array which contains the characters chosen

class Team {

    // Array to store the characters:
    
    var characters = [Character]()

    // Methods:
    
    func teamDescription() {
        
        for character in characters {
            character.descriptionCharacter()
        }
    }
}
