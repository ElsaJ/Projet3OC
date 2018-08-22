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
        var str = """
                       🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
                       🥊🥊🥊 LET THE FIGHT BEGIN !🥊🥊🥊
                       🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
         """
        print(str)
        while playerOne.isTeamAlive() && playerTwo.isTeamAlive() == true {
            print("\n Use number to choose character for the attack (or the Magus to heal)")
            swap(&attackerPlayer, &attackedPlayer)
            attackerPlayer.showTeam()
            let attacker = attackerPlayer.chooseCharacter()
            let randomChest = Bool.random()
            if randomChest {
                attacker.weapon = changeWeapon(type: attacker) }
            if attacker.type == .Magus {
                let healer = attacker
                print("\nChoose character you want to treat")
                let healed = attackerPlayer.chooseCharacter()
                heal(healer: healer, healed: healed)
            } else {
                print("\n Choose an ennemy to attack")
                attackedPlayer.showTeam()
                let attacked = attackedPlayer.chooseCharacter()
                if attacker.type == .Fairy {
                    fairyPower(attacked: attacked)
                } else {
                    fight(attacker: attacker, attacked: attacked) }
                numberOfTurn += 1
            }
        }
    }
    
    
    func endOfTheGame() {
        let str = """
                            \n🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
                         🥊🥊🥊🥊🥊🥊 AFTER \(numberOfTurn) ATTACKS 🥊🥊🥊🥊
                             🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
             """
        print(str)
        playerOne.printWinner()
        playerTwo.printWinner()
    }
    
    func restart() {
        playerOne.reinitTeam()
        playerTwo.reinitTeam()
    }
    
    
    private func fight(attacker: Character, attacked: Character) {
        let damages = attacker.damages()
        attacked.lifePoint -= damages
        if attacked.lifePoint > 0 {
            let str = """
            \n🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶
            🔵🔶\(attacker.name) takes \(damages) points to \(attacked.name) who's got now \(attacked.lifePoint) lifepoints🔵🔶
            🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶\n
            """
            print(str)
        } else {
            print("\n         ☠️ \(attacked.name) is DEAD ☠️")
        }
        
    }
    
    private func heal(healer: Character, healed: Character) {
        let heal = healer.healing()
        healed.lifePoint += heal
        let str = """
        \n🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵
        🔵🔶\(healer.name) treated \(healed.name) who's got now \(healed.lifePoint) lifepoints🔵🔶
        🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵\n
        """
        print(str)
    }
    
    private func fairyPower(attacked: Character) {
        if attacked.weapon.name != "Flower" {
            print("\n🌺🌻🌼 \(attacked.name), the fairy changed your weapon in a powerless flower 🌹🌸💐")
            attacked.weapon = Flower()
        } else {
            print("☠️ the fairy made you eat the flower full of poison, you're dead ☠️")
            attacked.lifePoint = 0
        }
    }
    
    
    private func createTeam() -> [Character] {
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
        let str = """
        This is the list of characters available :
        \(CharacterType.Fighter.rawValue)/ Fighter 🥊
        \(CharacterType.Colossus.rawValue)/ Colossus 💪🏼
        \(CharacterType.Dwarf.rawValue)/ Dwarf 🧝🏼‍♂️
        \(CharacterType.Fairy.rawValue)/ Fairy 🧚🏼‍♂️
        \(CharacterType.Magus.rawValue)/ Magus 🧙🏽‍♂️
        """
        print(str)
    }
    
    private func characterChoice() -> Character {
        let characterType = chooseCharacterType()
        let characterName = chooseCharacterName()
        let characterLifePoint = getLifePoint(type: characterType)
        let lifePoint = getLifePoint(type: characterType)
        let characterTools = getTools(type: characterType)
        
        return Character(name: characterName, type: characterType, maxLifePoint: characterLifePoint, lifePoint: lifePoint, weapon: characterTools)
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
    
    private func getTools(type: CharacterType) -> Weapon {
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
    
    private func changeWeapon(type: Character) -> Weapon {
        let newWeapon: Weapon
        if type.type == .Magus {
            let healingWeapons = [MagicPotion(),MagicWand()]
            let randomIndex = Int(arc4random_uniform(UInt32(healingWeapons.count)))
            let newHealingWeapon = healingWeapons[randomIndex]
            newWeapon = newHealingWeapon
            let str = """
            \n✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨
            ✨✨ You've got a new tools to heal: \(newHealingWeapon.name)✨✨
            ✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨\n
            """
            print(str)
        } else {
            let attackWeapons = [Bow(), Nunchaku(), ChainSaw()]
            let randomIndex = Int(arc4random_uniform(UInt32(attackWeapons.count)))
            let newAttackWeapon = attackWeapons[randomIndex]
            let str = """
            \n  🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑
                You've got a new weapon: \(newAttackWeapon.name)
              🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑\n
            """
            print(str)
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


