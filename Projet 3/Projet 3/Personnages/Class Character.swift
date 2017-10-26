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
    var lifeMax: Int
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
        print("Npm du personnage: \(name)")
        print("Points de vie: \(life)")
        print("Arme: \(weapon)")
        print("Dégats de l'arme: \(weapon.damage)")
    }
    
    // Inster data in Int:
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }

    // Method to choose the action (attack or care):
    
    func play() {
        var choicePlayer1: Int
        var choicePlayer2: Int
    
    repeat {
        print("Quel choix ?")
        print("1. Attaquer?")
        print("2. Soigner un personnage de votre équipe?")
        choicePlayer1 = inputInt()
        } while choicePlayer1 != 1 && choicePlayer1 != 2
        
        switch choicePlayer1 {
        case 1: print("")
        case 2: print("")
        default: print("")
        
    repeat {
        print("Quel choix ?")
        print("1. Attaquer?")
        print("2. Soigner un personnage de votre équipe?")
        choicePlayer2 = inputInt()
        } while choicePlayer2 != 1 && choicePlayer2 != 2
    }
}
}
