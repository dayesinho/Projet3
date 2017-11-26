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
        
        for i in 0..<characters.count {
            print("\(i + 1) " + characters[i].name + " Type de personnage: \(characters[i].type) / " + " Points de vie: \(characters[i].life) / " + "Points de dégats provoqués par son arme: \(characters[i].weapon.damage)")
        }
    }
}
