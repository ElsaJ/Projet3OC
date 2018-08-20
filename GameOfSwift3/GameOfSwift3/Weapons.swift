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
    var name: String
    init(name: String, damages: Int) {
        self.damages = damages
        self.name = name
    }
}


class Sword: Weapons {
    init() {
        super.init(name: "sword", damages: 10)
    }
}

class Mace: Weapons {
    init() {
        super.init(name: "mace", damages: 5)
    }
}

class Axe : Weapons {
    init() {
        super.init(name: "axe", damages: 7)
    }
}

class Saber: Weapons {
    init() {
        super.init(name: "saber", damages: 6)
    }
}

//class Bow: Weapons {
//    init(){
//        super.init(name: "Bow", damages: 8)
//    }
//}
//
//class ChainSaw: Weapons {
//    init(){
//        super.init(name: "Chain Saw", damages: 30)
//    }
//}
//
//class Nunchaku: Weapons {
//    init(){
//        super.init(name: "Nunchaku", damages: 20)
//    }
//}

class MedicinalPlant: Weapons {
    init(){
        super.init(name: "Medicinal plant", damages: 15)
    }
}

//class MagicWand: Weapons {
//    init(){
//        super.init(name: " Magic wand", damages: 25)
//    }
//}
//
//class MagicPotion: Weapons {
//    init(){
//        super.init(name: " Magic potion", damages: 10)
//    }
//}

