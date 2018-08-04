//
//  Character.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 21/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

// Creating class Character

enum CharacterType: Int {
    case Fighter = 1
    case Colossus 
    case Dwarf
    case Fairy
    case Magus
}

class Character {
    var lifePoint = 0
    var name: String
    var maxLifePoint: Int
    var tools: String
    var type: CharacterType
    init(name: String, type: CharacterType, maxLifePoint: Int, tools: String) {
        self.name = name
        self.type = type
        self.maxLifePoint = maxLifePoint
        self.tools = tools
    }
    
    func isAlive() -> Bool {
        if lifePoint < 1 {
            return false
        } else {
            return true
        }
    }
    
    
}
// Class fighter character

class Fighter: Character {
    init(){
        super.init(name: "", type: .Fighter, maxLifePoint: 100, tools:"sword")
    }
}

// Class Colossus character

class Colossus: Character {
    init(){
        super.init(name: "", type: .Colossus, maxLifePoint: 150, tools: "mace")
    }
}

//class Dwarf character

class Dwarf: Character {
    init(){
        super.init(name: "", type: .Dwarf, maxLifePoint: 120, tools: "axe")
    }
}

//class Fairy Character BONUS

class Fairy: Character{
    init(){
        super.init(name: "", type: .Fairy, maxLifePoint: 180, tools: "Saber")
    }
}

//class Magus Character

class Magus: Character {
    init(){
        super.init(name: "", type: .Magus, maxLifePoint: 80 , tools: "Plant")
    }
}
