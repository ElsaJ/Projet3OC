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
    if let choice = readLine(){
        switch choice {
        case"1":
            print("\n                            ROUND \(numberOfRounds)\n")
            restart()
        case"2":
            makeNewTeam()
        case"3":
            quit()
        default:
            print("What?")
        }
    }
}

private func printMenu() {
    let str = """
       What do you want to do?\n
        1. RESTART
        2. MAKE NEW TEAM
        3. QUIT
       """
    print(str)
}

private func restart() {
    gameManager.restart()
    gameManager.startGame()
    gameManager.endOfTheGame()
}

private func makeNewTeam() {
    gameManager.initGame()
    gameManager.startGame()
    gameManager.endOfTheGame()
}

private func quit() {
    print("➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔ THANKS FOR PLAYING")
    game = false
}

while game == true {
    numberOfRounds += 1
    menu()
}

