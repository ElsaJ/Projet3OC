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
    var characters = ["fighter", "Colossus", "Dwarf", "Fairy", "Magus"]
//    var character = [CharacterType]()
 
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func nameYourself() {
        print("Welcome \(name) !")
    }
    
    func makeYourTeam() {
        print("Choose three characters for your team :")
        for type in characters {
            print(type)
        }
        for _ in 0..<numberOfCharacter {
            if let charactername = readLine() {
                let character = Character(name: charactername, maxLifePoint: 180, tools: "Sword")
                team.append(character)
            }
        }
    }
    
    func printTeam() {
        for character in team {
            print(character.name)
        }
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
