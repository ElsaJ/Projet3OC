//
//  main.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 18/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

/// Bool property. While this var is true, the game is running
private var game = true
/// Int property. Give the number of round
private var numberOfRounds = 1
/// instance property of GameManager class
var gameManager = GameManager()
print("\n💪🏼⚔️💪🏼⚔️ 𝐖𝐄𝐋𝐂𝐎𝐌𝐄 𝐓𝐎 𝐆𝐀𝐌𝐄 𝐎𝐅 𝐒𝐖𝐈𝐅𝐓 𝐈𝐈𝐈 ⚔️💪🏼⚔️💪🏼")
gameManager.initGame()
gameManager.runGame()
gameManager.endGame()

/// private function to manage the game's menu
private func menu() {
    if let choice = readLine(){
        switch choice {
        case"1":
            print("\n                            ROUND \(numberOfRounds)\n")
            restartWithSameTeams()
        case"2":
            makeNewTeam()
        case"3":
            quit()
        default:
            print("What?")
        }
    }
}

/// private function to print the menu
private func printMenu() {
    let str = """
       What do you want to do?\n
        1. RESTART
        2. MAKE NEW TEAM
        3. QUIT
       """
    print(str)
}

/// private function to restart the game with the same teams
private func restartWithSameTeams() {
    gameManager.reinitBothTeams()
    gameManager.runGame()
    gameManager.endGame()
}

/// private function to restart the game with new teams
private func makeNewTeam() {
    gameManager.initGame()
    gameManager.runGame()
    gameManager.endGame()
}

/// private function to quit the game
private func quit() {
    print("➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔➔ THANKS FOR PLAYING")
    game = false
}

while game == true {
    numberOfRounds += 1
    menu()
}

