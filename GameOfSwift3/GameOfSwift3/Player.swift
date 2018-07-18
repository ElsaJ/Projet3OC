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
            + "\n \(CharacterType.Fighter.rawValue)/ Fighter"
            + "\n \(CharacterType.Colossus.rawValue)/ Colossus"
            + "\n \(CharacterType.Dwarf.rawValue)/ Dwarf"
            + "\n \(CharacterType.Fairy.rawValue)/ Fairy"
            + "\n \(CharacterType.Magus.rawValue)/ Magus")
    }
    
    private func characterChoice() -> Character {
        let characterType = chooseCharacterType()
        let characterName = chooseCharacterName()
        var characterLifePoint = getLifePoint(type: characterType)
        
        return Character(name: characterName, type: characterType, maxLifePoint: characterLifePoint, tools: "sword")
    }
    
    private func chooseCharacterType() -> CharacterType {
        print("Use number to choose three Characters for your team:")
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
        print("Now give him his own name : ")
        if let characterName = readLine(){
            let character = Character(name: characterName, type: .Fighter, maxLifePoint: 180, tools: "Sword")
            return characterName
        }
        return "Jo"
    }
    
    private func getLifePoint(type: CharacterType) -> Int {
            switch type {
            case .Fighter: 100
            case .Colossus: 150
            case .Dwarf: 120
            case .Fairy: 180
            case .Magus: 80
                
            }
         return 150
        }
    
}
