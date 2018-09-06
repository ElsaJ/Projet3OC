//
//  Weapons.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 04/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

/// class to define a weapon
class Weapon {
    var damages: Int
    var healing: Int
    var name: String
    init(name: String, damages: Int, healing: Int) {
        self.damages = damages
        self.name = name
        self.healing = healing
    }
}

/// class to define a sword
class Sword: Weapon {
    init() {
        super.init(name: "sword", damages: 10, healing: 0)
    }
}

/// class to define a mace
class Mace: Weapon {
    init() {
        super.init(name: "mace", damages: 5, healing: 0)
    }
}

/// class to define an axe
class Axe : Weapon {
    init() {
        super.init(name: "axe", damages: 7, healing: 0)
    }
}

/// class to define a saber
class Saber: Weapon {
    init() {
        super.init(name: "saber", damages: 6, healing: 0)
    }
}

/// class to define a bow
class Bow: Weapon {
    init(){
        super.init(name: "Bow", damages: 8, healing: 0)
    }
}

/// class to define a chainsaw
class ChainSaw: Weapon {
    init(){
        super.init(name: "Chain Saw", damages: 30, healing: 0)
    }
}

/// class to define a nunchaku
class Nunchaku: Weapon {
    init(){
        super.init(name: "Nunchaku", damages: 20, healing: 0)
    }
}

/// class to define a medicinal plant
class MedicinalPlant: Weapon {
    init(){
        super.init(name: "Medicinal plant", damages: 0, healing: 15)
    }
}

/// class to define a magic wand
class MagicWand: Weapon {
    init(){
        super.init(name: "Magic wand", damages: 0, healing: 25)
    }
}

/// class to define a magic potion
class MagicPotion: Weapon {
    init(){
        super.init(name: "Magic potion", damages: 0, healing: 30)
    }
}

/// class to define a flower
class Flower: Weapon {
    init(){
        super.init(name: "Flower", damages: 1, healing: 0)
    }
}

