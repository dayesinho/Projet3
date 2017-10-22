//
//  class personnage.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

// Var:
class Personnage {
    var nom: String
    var vie: Int
    var vieMax: Int
    var arme: Armes

// Init:
    init(nom: String, vie: Int, vieMax: Int, arme: Armes) {
        self.nom = nom
        self.vie = vie
        self.vieMax = vieMax
        self.arme = arme
    }
    
// Methods:
    
    func infligerDegats() {
        self.vieMax = self.vieMax - degat
    }
}
