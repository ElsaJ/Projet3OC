//
//  main.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 18/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

private var game = true
var gameManager = GameManager()
print("\n💪🏼⚔️💪🏼⚔️ 𝐖𝐄𝐋𝐂𝐎𝐌𝐄 𝐓𝐎 𝐆𝐀𝐌𝐄 𝐎𝐅 𝐒𝐖𝐈𝐅𝐓 𝐈𝐈𝐈 ⚔️💪🏼⚔️💪🏼")
gameManager.initGame()
gameManager.startGame()
gameManager.endOfTheGame()

private func menu() {
    print("What do you want to do?"
        + "\n1. RESTART"
        + "\n2. MAKE NEW TEAM"
        + "\n3. QUIT")
    
    if let choice = readLine(){
        switch choice {
        case"1":
            gameManager.restart()
            gameManager.startGame()
        case"2":
            gameManager.initGame()
            gameManager.startGame()
            gameManager.endOfTheGame()
        case"3":
            print("➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔ THANKS FOR PLAYING")
            game = false
        default:
            print("What?")
        }
    }
}

while game == true {
    menu()
}
