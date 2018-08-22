//
//  main.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 18/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

private var game = true
private var numberOfRounds = 1
var gameManager = GameManager()
print("\n💪🏼⚔️💪🏼⚔️ 𝐖𝐄𝐋𝐂𝐎𝐌𝐄 𝐓𝐎 𝐆𝐀𝐌𝐄 𝐎𝐅 𝐒𝐖𝐈𝐅𝐓 𝐈𝐈𝐈 ⚔️💪🏼⚔️💪🏼")
gameManager.initGame()
gameManager.startGame()
gameManager.endOfTheGame()

private func menu() {
    let str = """
       What do you want to do?\n
        1. RESTART
        2. MAKE NEW TEAM
        3. QUIT
       """
    print(str)
    if let choice = readLine(){
        switch choice {
        case"1":
            print("\n                            ROUND \(numberOfRounds)\n")
            gameManager.restart()
            gameManager.startGame()
            gameManager.endOfTheGame()
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
    numberOfRounds += 1
    menu()
}
