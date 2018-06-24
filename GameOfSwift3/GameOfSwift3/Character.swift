//
//  Character.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 21/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

// Creating class Character

class Character {
    
    let numberOfCharacter = 5
    var lifePoint: Int?
    var name: String?
    
    var characterType = String()
    var maxLifePoint: Int
    var tools: String
    init(characterType: String, maxLifePoint: Int, tools: String) {
    self.characterType = characterType
    self.maxLifePoint = maxLifePoint
    self.tools = tools
    
    }


    // Créer fonction pour que le joueur choisisse un nom unique par character
    // Créer fonction attaque
    
}

// Class fighter character

class Fighter: Character {
    init(){
        super.init(characterType: "fighter", maxLifePoint: 100, tools:"sword")
    }
}

// Class Colossus character

class Colossus: Character {
    init(){
        super.init(characterType: "Colossus", maxLifePoint: 150, tools: "mace")
    }
}

//class Dwarf character

class Dwarf: Character {
    init(){
        super.init(characterType: "Dwarf", maxLifePoint: 120, tools: "axe")
    }
}

//class Fairy Character BONUS

class Fairy: Character{
    init(){
        super.init(characterType: "Fairy", maxLifePoint: 180, tools: "Saber")
    }
}

//class Magus Character

class Magus: Character {
    init(){
        super.init(characterType: "Magus", maxLifePoint: 80 , tools: "Plant")
    }

//créer fonction treat
}

