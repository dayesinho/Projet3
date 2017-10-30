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
    let name: String
    var life: Int
    let lifeMax: Int
    var weapon: Weapon
    


// Init:
    
    init(name: String, life: Int, lifeMax: Int, weapon: Weapon) {
        self.name = name
        self.life = life
        self.lifeMax = lifeMax
        self.weapon = weapon
    }
    
// Methods:
    
    // Attack:
    
    func inflictDamage(target: Character) {
        target.life -= self.weapon.damage
        
        if self.life < 0 {
            self.life = 0
        }
    }
    
    // Description of the Characters:
    
    func descriptionCharacter() {
        print("D'un \(name) avec \(life) points de vie et avec une arme qui provoque \(weapon.damage) de dégats à son adversaire.")
    }
}


