//
//  File.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Warrior: Character {
    
    // MARK - Init
    init(name: String) {
        super.init(name: name, life: 100, lifeMax: 100, weapon: Sword(), type: "Combattant")
    }
}

