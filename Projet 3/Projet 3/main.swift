//
//  main.swift
//  Projet 3
//
//  Created by Mac Hack on 17/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Combat {
    
    var team1 = [Personnage]()
    var team2 = [Personnage]()
    let boucleInfinie = true
    
func accueil() {
        print("===============================")
        print("Bienvenue pour cette nouvelle partie de Terminaltor")
        print("Chaque joueur devra sélectionner 3 personnages de son choix, afin de débuter ce combart à mort!")
        print("===============================")
}
    
func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
}
    
func demarrer() {
    
    var choixJoueur: Int = 0
    var choixJoueur2: Int = 0
    
    repeat {
        accueil()
        repeat {
            choixJoueur = inputInt()
            choixJoueur2 = inputInt()
        } while choixJoueur != 1 && choixJoueur != 2 && choixJoueur != 3
        switch choixJoueur {
        case 1:
            
        case 2:
            
        case 3:
           
        default:
            break
        }
    } while boucleInfinie

    }
}
