//
//  main.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 18/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation


var gameManager = GameManager()
gameManager.initGame()
gameManager.startGame()

func menu() {
    print("What do you want to do?"
        + "\n1. Restart"
        + "\n2. Make new team"
        + "\n3. Quit")
    
    if let choice = readLine(){
        switch choice {
        case"1":
            print("Restart")
        case"2":
            print("Make new team")
        case"3":
            print("Quit")
        default:
            print("What?")
        }
    }
}

while true {
    menu()
}
