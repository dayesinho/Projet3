//
//  Team.swift
//  Projet 3
//
//  Created by Mac Hack on 31/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Team {

    // Array to store the characters:
    
    var characters = [Character]()

    // Method to descript the members of a team, the life and the damage that he can do:
    
    func teamDescription() {
        
        for i in 0..<characters.count {
            
            if characters[i].life > 1 {
            print("\(i + 1) " + " \(characters[i].name) |" + " Type du personnage: \(characters[i].type) | " + " Points de vie: \(characters[i].life) | " + "Points de dégats provoqués par son arme: \(characters[i].weapon.damage)")
            } else {
            print("\(characters[i].name) est mort et ne peut plus être utilisé")
            }
        }
    }
}
