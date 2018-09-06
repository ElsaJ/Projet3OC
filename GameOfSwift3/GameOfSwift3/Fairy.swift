//
//  Fairy.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 28/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

/// BONUS
/// class to define a fairy
class Fairy: Character {
    
    init(name: String){
        super.init(name: name, type: .Fairy, maxLifePoint: 180, lifePoint: 180, weapon: Saber())
    }
    
    /// method to allow the fairy's attack
    ///
    /// - Parameter attacked: character attacked by the fairy
    func attack(attacked: Character) {
        if attacked.weapon.name != "Flower" {
            print("\n🌺🌻🌼 \(attacked.name), the fairy changed your weapon in a powerless flower 🌹🌸💐")
            attacked.weapon = Flower()
        } else {
            print("\n          ☠️ the fairy made you eat the poisonous flower ☠️\n")
            attacked.lifePoint = 0
        }
    }
    
}
