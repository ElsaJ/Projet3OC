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
        print("Hello player, please enter your name: ")
        if let name = readLine(),
            name != "" {
            print("Welcome \(name) !")
            self.name = name
        } else  {
            print("error in naming, try again:")
            nameYourself()
        }
    }
    
    func resume() {
        print("\(name)'s team:")
        for character in team {
            print("\(character.type) \(character.name) who start with \(character.maxLifePoint) lifepoints and \(character.tools) in his hand")
        }
    }
    
    func chooseCharacter() -> Character {
        for (index, character) in team.enumerated() {
            print("\(index): \(character.name) the \(character.type)") }
            print("use number to choose your character")
            if let choice = readLine(),
                choice != "",
                let indexChoice = Int(choice) {
                let characterChoice = team[indexChoice]
                return team[indexChoice]
            } else {
                return chooseCharacter()
        }
    }
    
    func isTeamAlive() -> Bool {
        let isTeamAlive = team.contains { character in character.isAlive()}
        if isTeamAlive == true {
            return true
        } else {
            print("Game Over")
            return false
        }
    }

}
