//
//  colosse.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Colossus: Character {
    
    // MARK - Init
    init(name: String) {
        super.init(name: name, life: 90, lifeMax: 90, weapon: Axe(), type: "Colosse")
    }
}
