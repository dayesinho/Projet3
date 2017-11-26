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
    
    // Method in case of repeated names on characters:
    
    func repeatedNameCharacters() {
        
        // Var:
        var nameCharacters: String
        var nameCharactersArray = [String]()
        
        // Method:
        
        nameCharacters = inputString()
        nameCharactersArray.append(nameCharacters)
        
        for nameCharacters in nameCharactersArray {
            if nameCharacters != nameCharacters {
                print("")
            } else {
                print("Ce nom est déjà choisi, veuillez sélectionner un autre")
                return repeatedNameCharacters()
            }
        }
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
        print("")
        print("Les 2 équipes sont constituées!")
        print("")
        
        roundFight()
    }
    
    // Method to create characters:
    
    func createCharacters() -> [Character]{
        var characters = [Character]()
        
        var userChoice = 0
        let nameCharacters = String()
        
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
                repeatedNameCharacters()
            } while nameCharacters == ""
            
            switch userChoice {
                case 1:
                    let warrior = Warrior(name: nameCharacters)
                    characters.append(warrior)
                case 2:
                    let mage = Mage(name: nameCharacters)
                    characters.append(mage)
                case 3:
                    let colossus = Colossus(name: nameCharacters)
                    characters.append(colossus)
                case 4:
                    let dwarf = Dwarf (name: nameCharacters)
                    characters.append(dwarf)
            default: break
            }
        }
            return characters
    }

    // Method to start the battle between the teams:

    func roundFight() {
        
        var userChoice = 0
        var characterSelected : Character?
        
        if teamArray.count >= 2 {
            repeat {
                for i in 0..<2 {
                    print("")
                    print("Equipe n°\(i + 1) à vous de jouer")
                    print("Veuillez sélectionner un personnage de votre équipe:")
                    print("")
                    teamArray[i].teamDescription()
                    userChoice = 0
                    repeat {
                        userChoice = inputInt()
                    } while  userChoice != 1 && userChoice != 2 && userChoice != 3
                    characterSelected = teamArray[i].characters[userChoice - 1]
                    guard let currentCharacter = characterSelected else {return}
                    
                    if let character = currentCharacter as? Mage {
                      
                        // If the character choosen is a Mage:
                        
                        print("")
                        print("Qui souhaitez vous soigner?")
                        print("")
                        
                        teamArray[i].teamDescription()
                        userChoice = 0
                        repeat {
                            userChoice = inputInt()
                        } while  userChoice != 1 && userChoice != 2 && userChoice != 3
                        character.care(target: teamArray[i].characters[userChoice - 1])
                        print("Votre personnage a été soigné et a à présent \(currentCharacter.life) points de vie")
                    } else {
                        print("")
                        print("Quel personnage de l'équipe adverse souhaitez vous attaquer?")
                        print("")
                        
                        if i == 0 {
                            teamArray[i + 1].teamDescription()
                            userChoice = 0
                            repeat {
                                userChoice = inputInt()
                            } while userChoice != 1 && userChoice != 2 && userChoice != 3
                            currentCharacter.inflictDamage(target: teamArray[i + 1].characters[userChoice - 1])
                        } else {
                            teamArray[i - 1].teamDescription()
                            userChoice = 0
                            repeat {
                            userChoice = inputInt()
                            } while userChoice != 1 && userChoice != 2 && userChoice != 3
                            currentCharacter.inflictDamage(target: teamArray[i - 1].characters[userChoice - 1])
                        }
                    }
                }
            } while teamArray.count != 1
        } else {
            print("")
            print("Désolé, il faut au minimum 2 équipes pour pouvoir démarrer la partie")
            print("")
            }
        }
    
    func chest(target: Character) {
        
        let random = Int(arc4random_uniform(UInt32(2)))
        
        if random == 1 {
            print("")
            print("un coffre est apparu, souhaitez vous l'ouvrir ?")
            print("\n1 Oui")
            print("\n2 Non")
            print("")
            
            var playerChoice = inputInt()
            
            
        }
    }
}

