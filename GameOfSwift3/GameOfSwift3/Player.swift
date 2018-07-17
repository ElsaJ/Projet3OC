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
    var numberOfCharacter = 3
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func nameYourself() {
        for _ in 0..<1 {
            print("Please enter your name: ")
            if let name = readLine() {
                print("Welcome \(name) !")
                self.name = name
            }
        }
    }
    
    func makeYourTeam(){
        print("\(name), now make your team !")
        showList()
        while team.count < numberOfCharacter {
            let character = characterChoice()
            team.append(character)
        }
    }

    
    func printTeam() {
        print("\(name) this is your team:")
        for character in team {
            print("\(character.type) \(character.name) who start with \(character.maxLifePoint) lifepoints and \(character.tools) in his hand")
        }
    }
    
    func resume(){
        print(name)
        
    }
    
    private func showList() {
        
        print("This is the list of characters available :"
            + "\n \(CharacterType.Fighter.rawValue)"
            + "\n \(CharacterType.Colossus.rawValue)"
            + "\n \(CharacterType.Dwarf.rawValue)"
            + "\n \(CharacterType.Fairy.rawValue)"
            + "\n \(CharacterType.Magus.rawValue)")
    }
    
    private func characterChoice() -> Character {
        var characterType = chooseCharacterType()
        var characterName = chooseCharacterName()
        
        return Character(name: characterName, type: characterType, maxLifePoint: 180, tools: "sword")
    }
    
    private func chooseCharacterType() -> CharacterType {
        if let characterTypeString = readLine() {
            if let typeRawValue = Int(characterTypeString) {
                if let characterType = CharacterType(rawValue: typeRawValue) {
                    return characterType
                }
            }
        }
        return CharacterType.Fighter
    }
    
    private func chooseCharacterName() -> String {
        return "Jo"
    }
    
}
