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
    
    var name: String
    var lifePoint: Int
    var weapon: [String]
    init(name: String, lifePoint: Int, weapon: [String]) {
    self.name = name
    self.lifePoint = lifePoint
    self.weapon = weapon
    
    }
}
