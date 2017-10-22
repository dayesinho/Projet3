//
//  File.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Combattant: Personnage {
    
    // MARK - Init
    init() {
        super.init(nom: "combattant", vie: 100, vieMax: 100, arme: Epée())
    }
}

