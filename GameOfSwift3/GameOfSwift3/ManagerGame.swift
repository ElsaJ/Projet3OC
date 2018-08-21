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
    var playerOne = Player()
    private var playerTwo = Player()
    private var chosenNames = [String] ()
    private var numberOfTurn = 0
    
    // function Start the game
    
    func initGame() {
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
        print("        🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊")
        print("        🥊🥊🥊 LET THE FIGHT BEGIN !🥊🥊🥊")
        print("        🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊")
        while playerOne.isTeamAlive() && playerTwo.isTeamAlive() == true {
            print("\n Use number to choose character for the attack (or the Magus to treat)")
            swap(&attackerPlayer, &attackedPlayer)
            attackerPlayer.showTeam()
            let attacker = attackerPlayer.chooseCharacter()
            let randomChest = Bool.random()
            if randomChest {
                attacker.tools = changeWeapon(type: attacker) }
            if attacker.type == .Magus {
                let treater = attacker
                print("\nChoose character you want to treat")
                let treated = attackerPlayer.chooseCharacter()
                treat(treater: treater, treated: treated)
            } else {
                print("\n Choose an ennemy to attack")
                attackedPlayer.showTeam()
                let attacked = attackedPlayer.chooseCharacter()
                fight(attacker: attacker, attacked: attacked)
                numberOfTurn += 1
            }
        }
    }
    
    
    func endOfTheGame() {
        print("\n          🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊")
        print("          🥊🥊🥊🥊🥊🥊 AFTER \(numberOfTurn) ATTACKS 🥊🥊🥊🥊")
        print("          🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊")
        playerOne.printWinner()
        playerTwo.printWinner()
    }
    
    
    func fight(attacker: Character, attacked: Character) {
        let damages = attacker.damagesOrCare()
        attacked.lifePoint -= damages
        if attacked.lifePoint > 0 {
            print("\n🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶")
            print("🔵🔶\(attacker.name) takes \(damages) points to \(attacked.name) who's got now \(attacked.lifePoint) lifepoints🔵🔶")
            print("🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶\n")
        } else {
            print("\n         ☠️ \(attacked.name) is DEAD ☠️")
        }
        
    }
    
    func treat(treater: Character, treated: Character) {
        let care = treater.damagesOrCare()
        treated.lifePoint += care
        print("\n🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵")
        print("🔵🔶\(treater.name) treated \(treated.name) who's got now \(treated.lifePoint) lifepoints🔵🔶")
        print("🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵\n")
    }
    
    
    func createTeam() -> [Character] {
        var team = [Character]()
        print(" Make your team by choosing three characters !\n")
        showList()
        while team.count < numberOfCharacter {
            let character = characterChoice()
            team.append(character)
        }
        return team
    }
    
    
    private func showList() {
        
        print("This is the list of characters available :\n"
            + "\n \(CharacterType.Fighter.rawValue)/ Fighter 🥊"
            + "\n \(CharacterType.Colossus.rawValue)/ Colossus 💪🏼"
            + "\n \(CharacterType.Dwarf.rawValue)/ Dwarf 🧝🏼‍♂️"
            + "\n \(CharacterType.Fairy.rawValue)/ Fairy 🧚🏼‍♂️"
            + "\n \(CharacterType.Magus.rawValue)/ Magus 🧙🏽‍♂️")
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
        print("\nUse number to choose character for your team:\n")
        if let characterTypeString = readLine(),
            let typeRawValue = Int(characterTypeString),
            let characterType = CharacterType(rawValue: typeRawValue) {
            return characterType
        } else {
            print("❌ You have to choose number beetween one to five ❌")
            return chooseCharacterType()
        }
    }
    
    private func chooseCharacterName() -> String {
        print("\nNow give him his own name:\n")
        if let characterName = readLine(),
            characterName != "",
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
            print("❌ \(chosenCharacterName) already exists ❌")
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
            return MedicinalPlant()
        }
    }
    
    private func changeWeapon(type: Character) -> Weapons {
        let newWeapon: Weapons
        if type.type == .Magus {
            let careWeapons = [MagicPotion(),MagicWand()]
            let randomIndex = Int(arc4random_uniform(UInt32(careWeapons.count)))
            let newCareWeapon = careWeapons[randomIndex]
            newWeapon = newCareWeapon
            print("\n✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨")
            print("✨✨ You've got a new tools to care: \(newCareWeapon.name)✨✨")
            print("✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨\n")
        } else {
            let attackWeapons = [Bow(), Nunchaku(), ChainSaw()]
            let randomIndex = Int(arc4random_uniform(UInt32(attackWeapons.count)))
            let newAttackWeapon = attackWeapons[randomIndex]
            print("\n  🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑")
            print("    You've got a new weapon: \(newAttackWeapon.name)   ")
            print("  🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑\n")
            newWeapon = newAttackWeapon
        }
        return newWeapon
    }
    
}

extension Bool {
    static func random() -> Bool {
        return arc4random_uniform(2) == 0
    }
}


