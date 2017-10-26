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

    // Compose the team: 
    
    func start() {
        var choicePlayer1: Int = 0
        var choicePlayer2: Int = 0
    
    print(homePage())
        
    for _ in 1...3 {
        repeat {
            print("JOUEUR 1")
            addCharacterPlayer()
        repeat {
            choicePlayer1 = inputInt()
            } while choicePlayer1 != 1 && choicePlayer1 != 2 && choicePlayer1 != 3 && choicePlayer1 != 4
            switch choicePlayer1 {
            case 1:
                let perso1 = Combattant()
                team1.append(perso1)
                insertName()
            case 2:
                let perso1 = Mage()
                team1.append(perso1)
                insertName()
            case 3:
                let perso1 = Colosse()
                team1.append(perso1)
                insertName()
            case 4:
                let perso1 = Nain()
                team1.append(perso1)
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
                case 1:
                    let perso2 = Combattant()
                    team2.append(perso2)
                    insertName()
                case 2:
                    let perso2 = Mage()
                    team2.append(perso2)
                    insertName()
                case 3:
                    let perso2 = Colosse()
                    team2.append(perso2)
                    insertName()
                case 4:
                    let perso2 = Nain()
                    team2.append(perso2)
                    insertName()
                default:
                    break
                }
            } while infiniteLoop
        } while infiniteLoop
}
        
        
        //Composition of both teams:
        
        func compositionTeams() {
                    print("===============================")
                    print("L'équipe n°1 est composée de:")
                for perso1 in team1 {
                    print(perso1.descriptionCharacter())
                    print("===============================")
                    
                    print("L'équipe n°2 est composée de:")
                for perso2 in team2 {
                    print(perso2.descriptionCharacter())
                    print("===============================")
                }
            }
        }
    }

    // Initial home page of the game:
    
    func homePage() {
        
        print("===============================")
        print("Bienvenue sur Terminaltor!")
        print("Chaque joueur devra sélectionner 3 personnages de son choix, afin de débuter ce combat à mort!")
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
}
