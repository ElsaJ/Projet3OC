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
    
    var name: String
    var maxLifePoint: Int
    var lifePoint: Int
    var tools: Weapons
    var type: CharacterType
    init(name: String, type: CharacterType, maxLifePoint: Int, lifePoint: Int, tools: Weapons) {
        self.name = name
        self.type = type
        self.maxLifePoint = maxLifePoint
        self.lifePoint = lifePoint
        self.tools = tools
    }
    
    func isAlive() -> Bool {
        if lifePoint < 1 {
            return false
        } else {
            return true
        }
    }
    
    func damages() -> Int {
            switch tools {
            case is Sword:
                return 100
            case is Mace:
                return 5
            case is Axe:
                return 7
            case is Saber:
                return 6
            case is Plant:
                return 15
            default:
                return 0
            }
        }
}

// Class fighter character

class Fighter: Character {
    init(){
        super.init(name: "", type: .Fighter, maxLifePoint: 100, lifePoint: 100, tools: Sword())
    }
}

// Class Colossus character

class Colossus: Character {
    init(){
        super.init(name: "", type: .Colossus, maxLifePoint: 150, lifePoint: 150, tools: Mace())
    }
}

//class Dwarf character

class Dwarf: Character {
    init(){
        super.init(name: "", type: .Dwarf, maxLifePoint: 120, lifePoint: 120, tools: Axe())
    }
}

//class Fairy Character BONUS

class Fairy: Character{
    init(){
        super.init(name: "", type: .Fairy, maxLifePoint: 180, lifePoint: 180, tools: Saber())
    }
}

//class Magus Character

class Magus: Character {
    init(){
        super.init(name: "", type: .Magus, maxLifePoint: 80 , lifePoint: 80, tools: Plant())
    }
}
