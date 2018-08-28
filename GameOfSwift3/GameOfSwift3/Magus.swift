//
//  Magus.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 28/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation
class Magus: Character {
    
    init(){
        super.init(name: "", type: .Magus, maxLifePoint: 80 , lifePoint: 80, weapon: MedicinalPlant())
    }
    
    func healing() -> Int {
        return weapon.healing
        
    }
}
