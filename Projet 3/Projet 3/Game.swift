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
    var uniqueCharacterNameArray = [String]()
    var startGameDate = NSDate()
    
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
            print("")
            print("===============================")
            print("Constitution de l'équipe du joueur \(i + 1):")
            print("")
            let team = Team()
            team.characters = createCharacters()
            teamArray.append(team)
        }
        print("")
        print("Les 2 équipes sont constituées!")
        
        roundFight()
        showGameSettings()
    }
    
    // Method to create characters:
    
    func createCharacters() -> [Character]{
        var characters = [Character]()
        
        var userChoice = 0
        var nameCharacters = String()
        
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
                if uniqueCharacterNameArray.contains(nameCharacters) {
                    print("Ce nom est déjà choisi. Merci d'en sélectionner un autre:")
                    nameCharacters = ""
                } else {
                    uniqueCharacterNameArray.append(nameCharacters)
                }
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
                    print("======================")
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
                    
                    chest(target: currentCharacter)
                    
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
                        
                        print("Votre personnage a été soigné et a dorénavant \(teamArray[i].characters[userChoice - 1].life) points de vie")
                    } else {
                        
                        // If the character is a fighter:
                        
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
                            
                            print("Le personnage que vous venez d'attaquer, se retrouve à présent avec \(teamArray[i + 1].characters[userChoice - 1].life) points de vie")
                            
                            if checkDeadCharacters(team: teamArray[i + 1]) {
                                return // pour sortir de la fonction
                            }
                            
                        } else {
                            teamArray[i - 1].teamDescription()
                            userChoice = 0
                            repeat {
                            userChoice = inputInt()
                            } while userChoice != 1 && userChoice != 2 && userChoice != 3
                            currentCharacter.inflictDamage(target: teamArray[i - 1].characters[userChoice - 1])
                            
                            print("Le personnage que vous venez d'attaquer, se retrouve à présent avec \(teamArray[i - 1].characters[userChoice - 1].life) points de vie")
                            
                            if checkDeadCharacters(team: teamArray[i - 1]) {
                                return
                            }
                        }
                    }
                }
            } while true
        } else {
            print("")
            print("Désolé, il faut au minimum 2 équipes pour pouvoir démarrer la partie")
            print("")
            }
        }
    
    // Method that allows a chest appear on the game and give a new weapon or new powers to a Mage:
    
    func chest(target: Character) {
        
        let random = arc4random_uniform(5)
        
        if random == 1 {
            print("***********************")
            print("*** Un mistérieux coffre est apparu! ***")
            print("")
            
            if target is Mage {
                let magicScepter = MagicScepter()
                target.weapon = magicScepter
                print("\(target.name)" + "bénéficie a présent de pouvoir supplémentaires pour guérir les personnages de son équipe")
                print("***********************")
            } else {
                let crossbow = Crossbow()
                target.weapon = crossbow
                print(target.name + " ouvre le coffre et s'équipe d'une arbalète" )
                print("Ses points de dégats sont à présent de \(target.weapon.damage)")
                print("***********************")
            }
        }
    }
    
    // Method to calculate the duration in hours and minutes of the game:
    
    func showTimer(startGameDate: NSDate) -> String {
        
        // Var:
        
        let interval = NSDate().timeIntervalSince(startGameDate as Date) 
        
        let dateFormatter = DateComponentsFormatter()
        dateFormatter.unitsStyle = .short
        
        guard let timer = dateFormatter.string(from: interval) else { return "" }
        return timer
    }
    
    // Method to indicate the winner of the game and show the duration of the game:
    
    func showGameSettings() {
        
        var winnerTeam : String?
        
        if checkDeadCharacters(team: teamArray[0]) {
            winnerTeam = "équipe n°2"
        } else {
            winnerTeam = "équipe n°1"
        }
        guard let winner = winnerTeam else { return }
        print("La partie a été remportée par l'" + winner)
        
        print("La partie a durée: " + showTimer(startGameDate: startGameDate))
    }
    
    // Method to check if all the characters of a team are deads and allows exit of the while loop:
    
    func checkDeadCharacters(team: Team) -> Bool {
        
        var teamIsDead = false
        
        for i in 0..<team.characters.count {
            let character = team.characters[i]
            
            if character.life == 0 {
                teamIsDead = true
            } else {
                return false
            }
        }
        
        return teamIsDead
    }
}

