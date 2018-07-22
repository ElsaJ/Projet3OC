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
    let numberOfPlayers = 2
    var numberOfTeam = 2
    var playerOne = Player()
    var playerTwo = Player()
    
    // function Start the game
    
    func initGame() {
        print("Welcome to Game of Swift 3")
        playerOne.nameYourself()
        playerOne.makeYourTeam()
        playerTwo.nameYourself()
        playerTwo.makeYourTeam()
       
        playerOne.resume()
        playerTwo.resume()
    }
}
