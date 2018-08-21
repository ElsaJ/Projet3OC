//
//  Weapons.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 04/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

class Weapons {
    var damages: Int
    var healing: Int
    var name: String
    init(name: String, damages: Int, healing: Int) {
        self.damages = damages
        self.name = name
        self.healing = healing
    }
}


class Sword: Weapons {
    init() {
        super.init(name: "sword", damages: 10, healing: 0)
    }
}

class Mace: Weapons {
    init() {
        super.init(name: "mace", damages: 5, healing: 0)
    }
}

class Axe : Weapons {
    init() {
        super.init(name: "axe", damages: 7, healing: 0)
    }
}

class Saber: Weapons {
    init() {
        super.init(name: "saber", damages: 6, healing: 0)
    }
}

class Bow: Weapons {
    init(){
        super.init(name: "Bow", damages: 8, healing: 0)
    }
}

class ChainSaw: Weapons {
    init(){
        super.init(name: "Chain Saw", damages: 30, healing: 0)
    }
}

class Nunchaku: Weapons {
    init(){
        super.init(name: "Nunchaku", damages: 20, healing: 0)
    }
}

class MedicinalPlant: Weapons {
    init(){
        super.init(name: "Medicinal plant", damages: 0, healing: 15)
    }
}

class MagicWand: Weapons {
    init(){
        super.init(name: " Magic wand", damages: 0, healing: 25)
    }
}

class MagicPotion: Weapons {
    init(){
        super.init(name: " Magic potion", damages: 0, healing: 30)
    }
}

