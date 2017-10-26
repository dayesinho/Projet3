//
//  File.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Combattant: Character {
    
    // MARK - Init
    init() {
        super.init(name: "combattant", life: 100, lifeMax: 100, weapon: Epée())
    }
}

