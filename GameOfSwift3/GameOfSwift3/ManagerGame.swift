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
    var playerOne = Player(name:"PlayerOne")
    var playerTwo = Player(name:"PlayerTwo")
    
    
    // function Start the game
    
    func initGame() {
        print("Welcome to Game of Swift 3")
        playerOne.nameYourself()
        playerTwo.nameYourself()
        
        playerOne.makeYourTeam()
        playerOne.printTeam()
        playerTwo.makeYourTeam()
        playerTwo.printTeam()
        
    }
}
        
        // create team
        
//        print("Thanks know choose three characters for your team"
//            + "\n1. the Fighter"
//            + "\n2. The Colossus"
//            + "\n3. The Dwarf"
//            + "\n4. The Fairy"
//            + "\n5. The Magus")
//
//        let teamOne = readLine()
//        if let teamOne = teamOne {
//            playerOne = Player(name: "PlayerOne", team: [teamOne])
//        }
//
//        playerOne.makeYourTeam()
//
//        print("Thanks know choose three characters for your team"
//            + "\n1. the Fighter"
//            + "\n2. The Colossus"
//            + "\n3. The Dwarf"
//            + "\n4. The Fairy"
//            + "\n5. The Magus")
//
//        let teamTwo = readLine()
//        if let teamTwo = teamTwo {
//            playerTwo = Player(name: "PlayerTwo", team: [teamTwo])
//        }
//
//        playerTwo.makeYourTeam()
