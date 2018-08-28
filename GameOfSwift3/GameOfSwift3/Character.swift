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
    var weapon: Weapon
    var type: CharacterType
    init(name: String, type: CharacterType, maxLifePoint: Int, lifePoint: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.maxLifePoint = maxLifePoint
        self.lifePoint = lifePoint
        self.weapon = weapon
    }
    
    func isAlive() -> Bool {
        if lifePoint < 1 {
            return false
        } else {
            return true
        }
    }
    
    func damages() -> Int {
        return weapon.damages
    }
    
   
    
    
    // Class fighter character
    
    class Fighter: Character {
        init(){
            super.init(name: "", type: .Fighter, maxLifePoint: 100, lifePoint: 100, weapon: Sword())
        }
    }
    
    // Class Colossus character
    
    class Colossus: Character {
        init(){
            super.init(name: "", type: .Colossus, maxLifePoint: 150, lifePoint: 150, weapon: Mace())
        }
    }
    
    //class Dwarf character
    
    class Dwarf: Character {
        init(){
            super.init(name: "", type: .Dwarf, maxLifePoint: 120, lifePoint: 120, weapon: Axe())
        }
    }
    
    //class Fairy Character BONUS
    
    class Fairy: Character{
        init(){
            super.init(name: "", type: .Fairy, maxLifePoint: 180, lifePoint: 180, weapon: Saber())
        }
    }
    
}

