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
    var team: [String]
    var numberOfCharacter = 3
    var character = ["fighter", "Colossus", "Dwarf", "Fairy", "Magus"]
//    var character = [CharacterType]()
 
    var name: String
    init(name: String, team: [String]) {
        self.name = name
        self.team = team
    }
    
    func nameYourself() {
        print("Welcome \(name) !")
    }
    
    func makeYourTeam() {
        print("Choose three characters for your team :")
        for type in character {
            print(type)
        }
        let team = readLine()
        if let team = team {
        print("This is your team: \(team), now give names to your characters")
            let _ = readLine()
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
