//
//  MagicCare.swift
//  Projet 3
//
//  Created by Mac Hack on 30/11/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class MagicScepter: Weapon {
    
     // Init:
    
    init() {
        super.init(damage: 0)
    }
    
    // Method to boost the power of a Mage:
    
    func boostCare(target: Character) {
        
        if target.life > 0 {
            target.life += 12
            if target.life > target.lifeMax {
                target.life = target.lifeMax
            }
        }
    }
}

