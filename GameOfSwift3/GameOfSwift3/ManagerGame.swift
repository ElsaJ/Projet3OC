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
    private var numberOfCharacter = 3
    private var playerOne = Player()
    private var playerTwo = Player()
    private var chosenNames = [String] ()

    // function Start the game
    
    func initGame() {
        print("Welcome to Game of Swift 3")
        playerOne.nameYourself()
        let team1 = createTeam()
        playerOne.team = team1
        playerOne.resume()
        playerTwo.nameYourself()
        let team2 = createTeam()
        playerTwo.team = team2
        playerTwo.resume()
    }
    
    func startGame() {
        var attackerPlayer = playerOne
        var attackedPlayer = playerTwo
        while playerOne.isTeamAlive() && playerTwo.isTeamAlive() == true {
            print("Choose character to attack your opponent or character you want to treat")
            let attacker = attackerPlayer.chooseCharacter()
            print("choose ennemy to attack or Magus to treat")
            let attacked = attackedPlayer.chooseCharacter()
            fight(attacker: attacker, attacked: attacked)
            swap(&attackerPlayer, &attackedPlayer)
        }
        
    }
    
    func fight(attacker: Character, attacked: Character) {
        let damages = attacker.damages()
        attacked.lifePoint -= damages
        print("\(attacker.name) takes \(damages) points to \(attacked.name) who's got now \(attacked.lifePoint) lifepoints")

    }
    
    func createTeam() -> [Character] {
        var team = [Character]()
        print("Now make your team !")
        showList()
        while team.count < numberOfCharacter {
            let character = characterChoice()
            team.append(character)
        }
        
        return team
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
        let lifePoint = getLifePoint(type: characterType)
        let characterTools = getTools(type: characterType)
        
        return Character(name: characterName, type: characterType, maxLifePoint: characterLifePoint, lifePoint: lifePoint, tools: characterTools)
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
    
    private func getTools(type: CharacterType) -> Weapons {
        switch type {
        case .Fighter:
            return Sword()
        case .Colossus:
            return Mace()
        case .Dwarf:
            return Axe()
        case .Fairy:
            return Saber()
        case .Magus:
            return Plant()
        }
    }
}
