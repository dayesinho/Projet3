//
//  nain.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Nain: Personnage {
    
    // MARK - Init
    init() {
        super.init(nom: "Nain", vie: 65, vieMax: 65, arme: Marteau())
    }
}
