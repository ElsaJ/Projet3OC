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
private var team: [Character] = []
private var numberOfCharacter = 3
private var name = ""
    
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
    
    func resume() {
        print("\(name) this is your team:")
        for character in team {
            print("\(character.type) \(character.name) who start with \(character.maxLifePoint) lifepoints and \(character.tools) in his hand")
        }
    }
    
    private func showList() {
        
        print("This is the list of characters available :"
            + "\n \(CharacterType.Fighter.rawValue)/ Fighter"
            + "\n \(CharacterType.Colossus.rawValue)/ Colossus"
            + "\n \(CharacterType.Dwarf.rawValue)/ Dwarf"
            + "\n \(CharacterType.Fairy.rawValue)/ Fairy"
            + "\n \(CharacterType.Magus.rawValue)/ Magus")
    }
    
    private func characterChoice() -> Character {
        let characterType = chooseCharacterType()
        let characterName = chooseCharacterName()
        let characterLifePoint = getLifePoint(type: characterType)
        let characterTools = getTools(type: characterType)
        
        return Character(name: characterName, type: characterType, maxLifePoint: characterLifePoint, tools: characterTools)
    }
    
    private func chooseCharacterType() -> CharacterType {
        print("Use number to choose character for your team:")
        if let characterTypeString = readLine(),
            let typeRawValue = Int(characterTypeString),
            let characterType = CharacterType(rawValue: typeRawValue) {
            return characterType
        } else {
            print("You have to choose number beetween one to five, try again:")
            return chooseCharacterType()
        }
    }
    
    private func chooseCharacterName() -> String {
        print("Now give him his own name : ")
        if let characterName = readLine() {
            return characterName
        } else {
            print("Error in naming, try again:")
            return chooseCharacterName()
        }
    }
    
    private func getLifePoint(type: CharacterType) -> Int {
        switch type {
        case .Fighter:
            return 100
        case .Colossus:
            return 150
        case .Dwarf:
            return 120
        case .Fairy:
            return 180
        case .Magus:
            return 80
        }
    }
    
    private func getTools(type: CharacterType) -> String {
        switch type {
        case .Fighter:
            return ("Sword")
        case .Colossus:
            return ("Mace")
        case .Dwarf:
            return ("Axe")
        case .Fairy:
            return ("Saber")
        case .Magus:
            return ("Plant")
        }
    }
    
}
