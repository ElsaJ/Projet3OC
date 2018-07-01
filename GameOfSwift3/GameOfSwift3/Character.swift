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
    var lifePoint = 0
    var name: String
    var maxLifePoint: Int
    var tools: String
    init(name: String, maxLifePoint: Int, tools: String) {
        self.name = name
        self.maxLifePoint = maxLifePoint
        self.tools = tools
    }
    
}
// Class fighter character

class Fighter: Character {
    init(){
        super.init(name: "", maxLifePoint: 100, tools:"sword")
    }
}

// Class Colossus character

class Colossus: Character {
    init(){
        super.init(name: "", maxLifePoint: 150, tools: "mace")
    }
}

//class Dwarf character

class Dwarf: Character {
    init(){
        super.init(name: "", maxLifePoint: 120, tools: "axe")
    }
}

//class Fairy Character BONUS

class Fairy: Character{
    init(){
        super.init(name: "", maxLifePoint: 180, tools: "Saber")
    }
}

//class Magus Character

class Magus: Character {
    init(){
        super.init(name: "", maxLifePoint: 80 , tools: "Plant")
    }
}
