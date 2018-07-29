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
    private var chosenNames = [String] ()
    
    func nameYourself() {
        print("Hello player, please enter your name: ")
        if let name = readLine() {
            print("Welcome \(name) !")
            self.name = name
        } else  {
            print("error in naming, try again:")
            nameYourself()
        }
    }
    
    func makeYourTeam(){
        print("Now make your team !")
        showList()
        while team.count < numberOfCharacter {
            let character = characterChoice()
            team.append(character)
        }
    }
    
    func resume() {
        print("\(name)'s team:")
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
        print("Now give him his own name:")
        if let characterName = readLine(),
            nameIsUnique(chosenCharacterName: characterName) == false {
            chosenNames.append(characterName)
            print(chosenNames)
        return characterName
        } else {
            return chooseCharacterName()
        }
    }
    
    private func nameIsUnique(chosenCharacterName: String) -> Bool {
        var choice = true
            if  !chosenNames.contains(chosenCharacterName) {
                choice = false
            } else {
                print("\(chosenCharacterName) already exists")
                choice = true
            }
        return choice
        
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
