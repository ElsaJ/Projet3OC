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

let numberOfPlayer = 2
var numberOfTeam = 2
var team = [String].self
let numberOfCharacter = 3


    func chooseName() {
        let name = readLine()
        print("Hello \(String(describing: name))")
        
    }
    
    func createTeam(){
        print("Choose three characters")
        
    }

// Créer fonction pour que le joueur choisisse un nom unique par character
// Donner la liste des personnages de l'équipe adverse avec les propriétés utiles

//créer fonction attaque ou treat pour le mage
   // choisir un perso de son équipe
   // choisir une arme parmis celles proposées dans le coffre (différent pour mage)
   // choisir un personnage de l'équipe adverse à attaquer ou un perso à soigner
   // effectuer attaque
   // afficher ce qu'il vient de se passer
   // vérifier si les personnages sont toujours vivants
   // quand tous les persos d'une équipe sont morts le joueur a perdu

}
var playerOne = Player()
var playerTwo = Player()


