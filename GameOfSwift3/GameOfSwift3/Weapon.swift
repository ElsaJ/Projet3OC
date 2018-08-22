//
//  Weapons.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 04/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

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


class Sword: Weapon {
    init() {
        super.init(name: "sword", damages: 10, healing: 0)
    }
}

class Mace: Weapon {
    init() {
        super.init(name: "mace", damages: 5, healing: 0)
    }
}

class Axe : Weapon {
    init() {
        super.init(name: "axe", damages: 7, healing: 0)
    }
}

class Saber: Weapon {
    init() {
        super.init(name: "saber", damages: 6, healing: 0)
    }
}

class Bow: Weapon {
    init(){
        super.init(name: "Bow", damages: 8, healing: 0)
    }
}

class ChainSaw: Weapon {
    init(){
        super.init(name: "Chain Saw", damages: 30, healing: 0)
    }
}

class Nunchaku: Weapon {
    init(){
        super.init(name: "Nunchaku", damages: 20, healing: 0)
    }
}

class MedicinalPlant: Weapon {
    init(){
        super.init(name: "Medicinal plant", damages: 0, healing: 15)
    }
}

class MagicWand: Weapon {
    init(){
        super.init(name: "Magic wand", damages: 0, healing: 25)
    }
}

class MagicPotion: Weapon {
    init(){
        super.init(name: "Magic potion", damages: 0, healing: 30)
    }
}

class Flower: Weapon {
    init(){
        super.init(name: "Flower", damages: 1, healing: 0)
    }
}

