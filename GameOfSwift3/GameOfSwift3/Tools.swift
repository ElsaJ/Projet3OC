//
//  Tools.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 08/08/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

enum objects: String{
    case sword = "sword"
    case mace = "mace"
    case axe = "axe"
    case saber = "saber"
    case plant = "plant"
}

class Tools {
    var name: objects
    init(name: objects) {
        self.name = name
    }
}
