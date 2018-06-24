//
//  ManagerGame.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 18/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

// Create Game Manager to control the Game

class GameManager {
    var playerOne = Player(name: "PlayerOne")
    
    var playerTwo: Player?
  
    
// function Start the game
    
    func startGame() {
        print("Welcome to Game of Swift 3")
        print("Please enter your name: ")
        var playerOneName = readLine()
        if let playerOneName = playerOneName {
            playerOne = Player(name: playerOneName)
        }
        
        playerOne.nameYourself()
        
    }
}
