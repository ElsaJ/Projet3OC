//
//  Player.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 20/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

// Creation class Player

/// class to define a player
class Player {
    /// property which initialize an empty array to get the player's team
    var team: [Character] = []
    /// private property which initialize the player's name
    private var name = ""
    
    /// method to allow the player to choose a name
    func nameYourself() {
        print("\n Hello player, please enter your name: ")
        if let name = readLine(),
            name != "" {
            print("             Hey \(name) !\n")
            self.name = name
        } else  {
            print("error in naming, try again:")
            nameYourself()
        }
    }
    
    /// method to print the player's team
    func printTeam() {
        let str = """
        \n👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼
        \(name)'s team:
        """
        print(str)
        for character in team {
            print("\n \(character.type) \(character.name) who start with \(character.maxLifePoint) 💜 and \(character.weapon.name) in his hand")
        }
        
        print("\n👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼👦🏽👩🏻🧑🏿👱🏼‍♀️👧🏻🧒🏼\n")
    }
    
    /// private method to show the player's team during the game(dead characters aren't printed)
    func showTeamDuringTheGame() {
        for (index, character) in team.enumerated() {
            if character.lifePoint > 0 {
                print("\n\(index): \(character.name) the \(character.type): \(character.lifePoint) 💜, \(character.weapon.name)")}
        }
    }
    
    /// method to selected the character for the attack (or magus to treat)
    ///
    /// - Returns: return the selected character
    func selectedCharacter() -> Character {
        print("\nChoice:")
        if let choice = readLine(),
            choice != "",
            let indexChoice = Int(choice),
            indexChoice >= 0,
            indexChoice < team.count,
            team[indexChoice].isAlive() {
            return team[indexChoice]
        } else {
            print("❌ Error, try again! ❌ ")
            return selectedCharacter()
        }
    }
    
    /// method to verify if at least one character in the team is alive
    ///
    /// - Returns: return a bool, if it's false, all of the characters are dead
    func isTeamAlive() -> Bool {
        let isTeamAlive = team.contains { character in character.isAlive()}
        if isTeamAlive == true {
            return true
        } else {
            return false
        }
    }
    
    /// method to print the winner's name
    func printWinner() {
        if isTeamAlive() == true {
            let str = """
            🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇
            🥇🥇🥇🥇 👏🏻👏🏻 \(name) WON THE GAME 👏🏻👏🏻🥇🥇🥇🥇
            🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇🥇\n
            """
            print(str)
        }
    }
    
    /// In case of the player restarting the game with the same team, this method restores the character's lifepoints
    func reinitTeam() {
        for character in team {
            character.lifePoint = character.maxLifePoint
        }
    }
    
}
