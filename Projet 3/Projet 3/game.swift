//
//  game.swift
//  Projet 3
//
//  Created by Mac Hack on 24/10/2017.
//  Copyright © 2017 Mac Hack. All rights reserved.
//

import Foundation


class Game {
    
    // Var:
    
    var teamArray = [Team]()
    
    
    // Methods:
    
    // Insert choice by the player in Int:
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    
    // Insert choice by the player in String:
    
    func inputString() -> String {
        
        guard let data = readLine() else { return "" }
        return data
    }

    // Start of the game:
    
    func start() {
      
        print("===============================")
        print("Bienvenue sur Terminaltor!")
        print("Dans un premier temps, chaque joueur devra sélectionner 3 personnages de son choix, afin de débuter ce combat à mort!")
        print("===============================")
        
        for i in 0..<2 {
            print("Constitution de l'équipe du joueur \(i + 1):")
            let team = Team()
            team.characters = createCharacters()
            teamArray.append(team)
        }
        print("Les 2 équipes sont constituées")
        roundFight()
    }
    
    // Method to create characters:
    
    func createCharacters() -> [Character]{
        var characters = [Character]()
        
        var userChoice = 0
        var nameCharacters = ""
        
        for i in 0..<3 {
            print("Choisissez votre personnage n°\(i + 1)")
            print("1 Combattant")
            print("2 Mage")
            print("3 Colosse")
            print("4 Nain")
            
            repeat {
                userChoice = inputInt()
            } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
            
            print("Merci de donner un nom à votre personnage:")
            repeat {
                nameCharacters = inputString()
            } while nameCharacters == ""
            
            switch userChoice {
                case 1:
                    let combattant = Combattant(name: nameCharacters)
                    characters.append(combattant)
                case 2:
                    let mage = Mage(name: nameCharacters)
                    characters.append(mage)
                case 3:
                    let colosse = Colosse(name: nameCharacters)
                    characters.append(colosse)
                case 4:
                    let nain = Nain(name: nameCharacters)
                    characters.append(nain)
            default: break
            }
        }
            return characters
    }

    // Method to start the battle between the teams:

    func roundFight() {
        
        var userChoice = 0
        
        if teamArray.count >= 2 {
           
        } else {
            print("Désolé, il faut au minimum 2 équipes pour pouvoir démarrer la partie")
        }
        
        repeat {
            userChoice = inputInt()
        } while userChoice != 1 && userChoice != 2

        
        for i in 0..<2 {
            print("Veuillez sélectionner votre personnage pour attaquer l'adversaire:")
            let perso = teamArray[i]
            perso.teamDescription()
            
        }
    }
}
