//
//  mage.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Mage: Character {
    
    // MARK - Init
    init(name: String) {
        super.init(name: name, life: 100, lifeMax: 100, weapon: Scepter(), type: "Mage")
    }
    
    // Methods:
    override func inflictDamage(target: Character) {
        print("Ce personnage ne peut pas attaquer")
    }
    
    func care(target: Character) {
        
        if target.life > 0 {
            target.life += 8
            if target.life > target.lifeMax {
                target.life = target.lifeMax
            }
        }
    }
}

