//
//  Player.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 20/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

// Creation class Player

class Player {
    var team: [Character] = []
    var numberOfCharacter = 3
//    var player = Player(name: "playername")
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func nameYourself() {
        for _ in 0..<1 {
            print("Please enter your name: ")
            if let name = readLine() {
                let player = Player(name: name)
                print("Welcome \(name) !")
            }
        }
    }
    
    func makeYourTeam() {
        
        // list of characters
        
        print("\(name), use number to choose three characters for your team, then name each one of them :"
            + "\n \(CharacterType.Fighter.rawValue)/ Fighter"
            + "\n \(CharacterType.Colossus.rawValue)/ Colossus"
            + "\n \(CharacterType.Dwarf.rawValue)/ Dwarf"
            + "\n \(CharacterType.Fairy.rawValue)/ Fairy"
            + "\n \(CharacterType.Magus.rawValue)/ Magus")
        
        // character choice for each team
        
        for _ in 0..<numberOfCharacter {
            print("\(name),choose your character's number:")
            if let type = readLine(){
                if let choice = Int(type) {
                    switch choice {
                    case 1:
                        print("\(name), give him his own name: ")
                        if let charactername = readLine() {
                            let character = Character(name: charactername, type: .Fighter, maxLifePoint: 180, tools: "Sword")
                            team.append(character)
                        }
                    case 2:
                        print("\(name), give him his own name: ")
                        if let charactername = readLine() {
                            let character = Character(name: charactername, type: .Colossus, maxLifePoint: 150, tools: "mace")
                            team.append(character)
                        }
                    case 3:
                        print("\(name), give him his own name: ")
                        if let charactername = readLine() {
                            let character = Character(name: charactername, type: .Dwarf, maxLifePoint: 120, tools: "axe")
                            team.append(character)
                        }
                    case 4:
                        print("\(name), give him his own name: ")
                        if let charactername = readLine() {
                            let character = Character(name: charactername, type: .Fairy, maxLifePoint: 100, tools: "Saber")
                            team.append(character)
                        }
                    case 5:
                        print("\(name), give him his own name: ")
                        if let charactername = readLine() {
                            let character = Character(name: charactername, type: .Magus, maxLifePoint: 80, tools: "Plant")
                            team.append(character)
                        }
                    default:
                        print("I'dont understand your choice")
                    }
                }
            }
        }
    }
    
    func printTeam() {
        print("\(name) this is your team:")
        for character in team {
            print("\(character.type) \(character.name) who start with \(character.maxLifePoint) lifepoints and \(character.tools) in his hand")
        }
    }
    
    func resume(){
                print(self.name)
       
        }

}



//
// Créer fonction pour que le joueur choisisse un nom unique par character
// Donner la liste des personnages de l'équipe adverse avec les propriétés utiles

//créer fonction attaque ou treat pour le mage
   // choisir un perso de son équipe
   // choisir une arme parmis celles proposées dans le coffre (différent pour mage)
   // choisir un personnage de l'équipe adverse à attaquer ou un perso à soigner
   // effectuer attaque - fonction fight
   // afficher ce qu'il vient de se passer
    
   // vérifier si les personnages sont toujours vivants
    
//       while lifePoint > 0 {
//             attack() }
//        print("You are dead)
//
//           }
   // quand tous les persos d'une équipe sont morts le joueur a perdu
