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
    init() {
        super.init(name: "Mage", life: 100, lifeMax: 100, weapon: Scepter())
    }
    
    // Methods:
    override func inflictDamage(target: Character) {
        print("Ce personnage ne peut pas attaquer")
    }
    
    func care(target: Character) {
        self.life += 8
        
        if life > lifeMax {
            life = lifeMax
        }
    }
}


