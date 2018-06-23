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
    
    let numberOfTeam = 2
    let numberofplayer = 2
    var game: Bool = false
    
// function Start the game
    
    func startGame() {
        print("Welcome to Game of Swift 3")
        print("Please enter your name.")
        _ = readLine()
        
        game = true
        
    }
    
    func restartGame () {
        print("Do you want to restart?")
        
        game = true
        
    }
}
var start = GameManager()
var restart = GameManager()






