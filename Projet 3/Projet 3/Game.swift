//
//  game.swift
//  Projet 3
//
//  Created by Mac Hack on 24/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation

class Game {
    
//Var:
    
    var team1 = [Character]()
    var team2 = [Character]()
    let infiniteLoop = false
    
// Methods:
    
    // Insert choice by the player in Int:
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    // Home page of the game:
    
    func homePage() {
        
        print("===============================")
        print("Bienvenue sur Terminaltor!")
        print("Dans un premier temps, chaque joueur devra sélectionner 3 personnages de son choix, afin de débuter ce combat à mort!")
        print("===============================")
    }
    
    // Menu to select characters for both players:
    
    func addCharacterPlayer() {
        
        print("===============================")
        print("Merci de sélectionner l'un des personnages suivants:")
        print("1 - Le combattant")
        print("2 - Le mage")
        print("3 - Le colosse")
        print("4 - Le nain")
        print("===============================")
    }
    
    // Method to insert name to the characters:
    
    func insertName() {
        print("Merci d'indiquer un nom à votre personnage")
        readLine()
    }
    
    //Composition of both teams:
    
    func compositionTeam() {
        print("===============================")
        print("L'équipe n°1 est composée:")
        for persoteam1 in team1 {
            persoteam1.descriptionCharacter()
        }
        print("===============================")
        print("===============================")
        print("L'équipe n°2 est composée de:")
        for persoteam2 in team2 {
            persoteam2.descriptionCharacter()
        }
        print("===============================")
        print("Les équipes sont prêtes! Que la bataille commence!")
        print("===============================")
    }
    
    // Method to start the battle between both teams:
    
    func battle() {
        var choicePlayer1 = 0

            print("Que souhaitez-vous faire ?"
            + "\n1. Attaquer un adversaire?"
            + "\n2. Soigner un personnage de votre équipe?")
            
            choicePlayer1 = inputInt()
        if choicePlayer1 == 1 {
            for _ in team2 {
                print(" Attaquer quel adversaire?:"
                    + "\n1. \(at:0)"
                    + "\n2. \(at:1)"
                    + "\n3. \(at:2)")
                }
            }
        }
    
// Start of the game:
    
    // Var:
    
    func start() {
        var choicePlayer1 = 0
        var choicePlayer2 = 0
    
        let perso1 = Combattant()
        let perso2 = Mage()
        let perso3 = Colosse()
        let perso4 = Nain()
        
    print(homePage())
        
    for _ in 1...3 {
        repeat {
            print("JOUEUR 1")
            addCharacterPlayer()
        repeat {
            choicePlayer1 = inputInt()
            } while choicePlayer1 != 1 && choicePlayer1 != 2 && choicePlayer1 != 3 && choicePlayer1 != 4
            switch choicePlayer1 {
                
            case 1: team1.append(perso1)
                    insertName()
            case 2: team1.append(perso2)
                    insertName()
            case 3: team1.append(perso3)
                    insertName()
            case 4: team1.append(perso4)
                    insertName()
            default:
                break
            }
            repeat {
                print("JOUEUR 2")
                addCharacterPlayer()
                repeat {
                    choicePlayer2 = inputInt()
                } while choicePlayer2 != 1 && choicePlayer2 != 2 && choicePlayer2 != 3 && choicePlayer2 != 4
                switch choicePlayer2 {
                case 1: team2.append(perso1)
                        insertName()
                case 2: team2.append(perso2)
                        insertName()
                case 3: team2.append(perso3)
                        insertName()
                case 4: team2.append(perso4)
                        insertName()
                default:
                    break
                    }
                } while infiniteLoop
            } while infiniteLoop
        }; game.compositionTeam()
    }
}

