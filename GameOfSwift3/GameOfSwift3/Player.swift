//
//  Player.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 20/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

// Creation class Player

class Player {
    var team: [Character] = []
    private var name = ""
    
    func nameYourself() {
        print("\n Hello player, please enter your name: ")
        if let name = readLine(),
            name != "" {
            print(" Welcome \(name) !\n")
            self.name = name
        } else  {
            print("error in naming, try again:")
            nameYourself()
        }
    }
    
    func resume() {
        print("\n \(name)'s team:")
        for character in team {
            print("\n\(character.type) \(character.name) who start with \(character.maxLifePoint) 💜 and \(character.tools.name) in his hand")
        }
    }
    
    func showTeam() {
        for (index, character) in team.enumerated() {
            if character.lifePoint > 0 {
                print("\n\(index): \(character.name) the \(character.type): \(character.lifePoint) 💜, \(character.tools.name)")}
        }
    }
    
    func chooseCharacter() -> Character {
        print("\nChoice:")
        if let choice = readLine(),
            choice != "",
            let indexChoice = Int(choice),
            indexChoice >= 0,
            indexChoice < team.count,
            team[indexChoice].isAlive() {
            return team[indexChoice]
        } else {
            print("Error, try again! ")
            return chooseCharacter()
        }
    }
    
    func isTeamAlive() -> Bool {
        let isTeamAlive = team.contains { character in character.isAlive()}
        if isTeamAlive == true {
            return true
        } else {
            return false
        }
    }
    
    func printWinner() {
        if isTeamAlive() == true {
            print("🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇")
            print("🥇🥇🥇🥇 👏🏻👏🏻 \(name) WON THE GAME 👏🏻👏🏻🥇🥇")
            print("🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇\n")
        }
    }
    
}
