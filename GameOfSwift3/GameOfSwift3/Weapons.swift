//
//  Weapons.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 04/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

class Weapons {
    init(name: String, damages: Int) {
        self.name = name
        self.damages = damages
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

class Plant: Weapons {
    init(){
        super.init(name: "plant", damages: 15)
    }
}
