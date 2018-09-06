//
//  Magus.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 28/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

/// class to define a Magus
class Magus: Character {
    
    init(name: String){
        super.init(name: name, type: .Magus, maxLifePoint: 80 , lifePoint: 80, weapon: MedicinalPlant())
    }
    
    /// method to recover a number corresponding to the healing process of each healing tools
    ///
    /// - Returns: return an intiger
    func heal() -> Int {
        return weapon.healing
        
    }
}
