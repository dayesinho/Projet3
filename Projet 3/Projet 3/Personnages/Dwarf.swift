//
//  nain.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Dwarf: Character {
    
    // Init:
    
    init(name: String) {
        super.init(name: name, life: 65, lifeMax: 65, weapon: Hammer(), type: "Nain")
    }
}
