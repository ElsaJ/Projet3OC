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
    var playerOne = Player(name:"PlayerOne", team: ["T1"])
    var playerTwo = Player(name:"PlayerTwo", team: ["T2"])
  
    
// function Start the game
    
    func startGame() {
        print("Welcome to Game of Swift 3")
        print("Please enter your name: ")
        let playerOneName = readLine()
        if let playerOneName = playerOneName {
            playerOne = Player(name: playerOneName, team: ["T1"])
        }
        playerOne.nameYourself()
        
        print("Please enter your name: ")
        let playerTwoName = readLine()
        if let playerTwoName = playerTwoName {
            playerTwo = Player(name: playerTwoName, team: ["T2"])
        }
        
        playerTwo.nameYourself()
        
        print("Thanks, know choose three characters for your team")
        playerOne.chooseCharacters()
        
    }
}
