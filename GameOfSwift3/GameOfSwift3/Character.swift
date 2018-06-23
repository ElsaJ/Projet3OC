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
    
    var numberOfCharacter = 5
    var lifePoint: Int?
    
    var name: String
    var maxLifePoint: Int
    var baseWeapon: String
    init(name: String, maxLifePoint: Int, baseWeapon: String) {
    self.name = name
    self.maxLifePoint = maxLifePoint
    self.baseWeapon = baseWeapon
    
    }
}

// Class fighter character

class Fighter: Character {
    init(){
        super.init(name:"fighter", maxLifePoint: 100, baseWeapon:"sword")
    }
}

// Class Colossus character

class Colossus: Character {
    init(){
        super.init(name:"Colossus", maxLifePoint: 150, baseWeapon: "mace")
    }
}

//class Dwarf character

class Dwarf: Character {
    init(){
        super.init(name:"Dwarf", maxLifePoint: 120, baseWeapon: "axe")
    }
}

//class Fairy Character BONUS

class Fairy: Character{
    init(){
    super.init(name:"Fairy", maxLifePoint: 180, baseWeapon: "Saber")
    }
}

//class Magus Characer

class Magus: Character {
    init(){
        super.init(name:"Magus", maxLifePoint: 80 , baseWeapon: "Plant")
    }
}

