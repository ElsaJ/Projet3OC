//
//  Character.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 21/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

/// enumeration to assign an intiger to each character's type
enum CharacterType: Int {
    case Fighter = 1
    case Colossus 
    case Dwarf
    case Fairy
    case Magus
}

/// class to define a character
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
    
    /// method to verify if the character is alive
    ///
    /// - Returns: return a bool, if it's false, the character is dead
    func isAlive() -> Bool {
        if lifePoint < 1 {
            return false
        } else {
            return true
        }
    }
    
    /// method to recover a number corresponding to the damages that each weapon inflicts
    ///
    /// - Returns: return an intiger
    func getDamages() -> Int {
        return weapon.damages
    }
    
}

/// normally, I should create one file per class, in those cases, classes are very minimalist, so I decided to let them in the character's file
/// Class to define the fighter
class Fighter: Character {
    init(name: String){
        super.init(name: name, type: .Fighter, maxLifePoint: 100, lifePoint: 100, weapon: Sword())
    }
}


/// class to define the colossus
class Colossus: Character {
    init(name: String){
        super.init(name: name, type: .Colossus, maxLifePoint: 150, lifePoint: 150, weapon: Mace())
    }
}


/// class to define the dwarf
class Dwarf: Character {
    init(name: String){
        super.init(name: name, type: .Dwarf, maxLifePoint: 120, lifePoint: 120, weapon: Axe())
    }
}







