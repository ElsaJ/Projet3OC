//
//  Player.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 20/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

// Creation class Player

class Player {
    
    func chooseName() {
        let name = readLine()
        print("Hello \(String(describing: name))")
        
    }
}
var playerOne = Player()
var playerTwo = Player()


