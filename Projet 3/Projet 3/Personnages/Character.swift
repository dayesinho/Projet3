//
//  class personnage.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

// Var:

class Character {
    var name: String
    var life: Int
    let lifeMax: Int
    var weapon: Weapon
    var type: String

// Init:
    
    init(name: String, life: Int, lifeMax: Int, weapon: Weapon, type: String) {
        self.name = name
        self.life = life
        self.lifeMax = lifeMax
        self.weapon = weapon
        self.type = type
    }
    
// Methods:
    
    // Attack:
    
    func inflictDamage(target: Character) {
        
        if self.life > 0 {
            target.life -= self.weapon.damage
            } else if self.life < 0 {
            target.life = 0
            print("Je ne peux pas attaquer, je suis mort :(")
        }
    }
}

