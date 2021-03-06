//
//  ManagerGame.swift
//  GameOfSwift3
//
//  Created by Elsa Jeannin on 18/06/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import Foundation

/// Class GameManager to manage the majority of game's actions
class GameManager {
    /// private Int property which gives the number of character in a team
    private var numberOfCharacterInTeam = 3
    /// private instance property of class Player which create player one
    private var playerOne = Player()
    /// private instance property of class Player which create player two
    private var playerTwo = Player()
    /// private property which initialize an empty array of string to keep each unique name of characters in teams
    private var chosenNamesForCharacters = [String] ()
    /// private property which give the number of turn in the game
    private var numberOfTurn = 0
    
    
    /// method to name both of players and create teams
    func initGame() {
        playerOne.setName()
        let team1 = createTeam()
        playerOne.team = team1
        playerOne.printTeam()
        playerTwo.setName()
        let team2 = createTeam()
        playerTwo.team = team2
        playerTwo.printTeam()
    }
    
    /// method to manage fights beetween the teams and healing process
    func runGame() {
        var attackerPlayer = playerOne
        var attackedPlayer = playerTwo
        while playerOne.isTeamAlive() && playerTwo.isTeamAlive() == true {
            swap(&attackerPlayer, &attackedPlayer)
            print("\n Use number to choose character for the attack (or the Magus to heal)")
            attackerPlayer.showTeam()
            let attacker = attackerPlayer.selectCharacter()
            randomWeapon(type: attacker)
            if attacker.type == .Magus {
                let healed = attackerPlayer.selectCharacter()
                heal(healer: attacker, healed: healed)
            } else {
                print("\n Choose an ennemy to attack")
                attackedPlayer.showTeam()
                let attacked = attackedPlayer.selectCharacter()
                if fairyAction(attacker: attacker, attacked: attacked) == true {
                    fight(attacker: attacker, attacked: attacked)
                } else {
                    fight(attacker: attacker, attacked: attacked) }
                numberOfTurn += 1
            }
        }
    }
    
    /// method to print number of rounds and the winner of the game
    func endGame() {
        let str = """
        🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
        🥊🥊🥊🥊🥊 AFTER \(numberOfTurn) ATTACKS 🥊🥊🥊🥊🥊
        🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
        """
        print(str)
        playerOne.printWinnerIfNeeded()
        playerTwo.printWinnerIfNeeded()
    }
    
    /// method to reinitalize both teams
    func reinitBothTeams() {
        playerOne.reinitTeam()
        playerTwo.reinitTeam()
    }
    
    /// private method to print the beginning of the game
    private func printStart() {
        let str = """
                       🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
                       🥊🥊🥊 LET THE FIGHT BEGIN !🥊🥊🥊
                       🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊🥊
         """
        print(str)
    }
    
    /// private method which using a bool to reveal a random chest
    private func randomChest() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
    
    /// private method which allow to change weapon or healing tool randomly
    ///
    /// - Parameter type: Magus or the other characters
    private func randomWeapon(type: Character) {
        let chest = randomChest()
        if chest {
            if type.type == .Magus {
                type.weapon = changeHealingTool(type: type)
            } else {
                type.weapon = changeWeapon(type: type) }
        }
    }
    
    /// private method to manage fairy's action
    ///
    /// - Parameters:
    ///   - attacker: Fairy
    ///   - attacked: the character of the other team attacked by the fairy
    /// - Returns: if it's a fairy, the boolean is equal true and allows fairy's action
    private func fairyAction(attacker: Character, attacked: Character) -> Bool {
        var isAFairy: Bool
        if attacker.type == .Fairy {
            let attacker = Fairy(name: "")
            attacker.attack(attacked: attacked)
            isAFairy = true
        } else {
            isAFairy = false
        }
        
        return isAFairy
    }
    
    
    /// private method which manages the fight beetween two characters
    ///
    /// - Parameters:
    ///   - attacker: character of team one
    ///   - attacked: character of team two
    private func fight(attacker: Character, attacked: Character) {
        let damages = attacker.getDamages()
        attacked.lifePoint -= damages
        if attacked.lifePoint > 0 {
            let str = """
            \n🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵
            🔵🔶\(attacker.name) takes \(damages) points to \(attacked.name) who's got now \(attacked.lifePoint) lifepoints🔵🔶
            🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵\n
            """
            print(str)
        } else {
            print("\n                        ☠️ \(attacked.name) is DEAD ☠️\n")
        }
        
    }
    
    /// private method to manage the healing process
    ///
    /// - Parameters:
    ///   - healer: Magus
    ///   - healed: character to heal in the same team
    private func heal(healer: Character, healed: Character) {
        if healer.type == .Magus {
            let healer = Magus(name: "")
            let heal = healer.heal()
            healed.lifePoint += heal
        }
        let str = """
        \n🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵
        🔵🔶\(healer.name) treated \(healed.name) who's got now \(healed.lifePoint) lifepoints🔵🔶
        🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵🔶🔵\n
        """
        print(str)
    }
    
    
    
    /// private method to create a team
    ///
    /// - Returns: retunr an array with chosen characters for the team
    private func createTeam() -> [Character] {
        var team = [Character]()
        print(" Make your team by choosing three characters !\n")
        showList()
        while team.count < numberOfCharacterInTeam {
            let character = characterChoice()
            team.append(character)
        }
        return team
    }
    
    
    /// private method to show the list of characters available
    private func showList() {
        let str = """
        This is the list of characters available:\n
        \(CharacterType.Fighter.rawValue)/ Fighter, a classic warrior 🥊
        \(CharacterType.Colossus.rawValue)/ Colossus, very resistant 💪🏼
        \(CharacterType.Dwarf.rawValue)/ Dwarf, watch out for his axe! 🧝🏼‍♂️
        \(CharacterType.Fairy.rawValue)/ Fairy, with magic and deadly powers 🧚🏼‍♂️
        \(CharacterType.Magus.rawValue)/ Magus, allows you to treat one of your character 🧙🏽‍♂️
        """
        print(str)
    }
    
    /// private method to choose one character
    ///
    /// - Returns: return a character whith all of his properties
    private func characterChoice() -> Character {
        let characterType = chooseCharacterType()
        let characterName = chooseCharacterName()
        
        switch characterType {
        case .Fighter: return Fighter(name: characterName)
        case .Colossus: return Colossus(name: characterName)
        case .Dwarf: return Dwarf(name: characterName)
        case .Magus: return Magus(name: characterName)
        case .Fairy: return Fairy(name: characterName)
            
        }
    }
    
    /// private method to choose a character type
    ///
    /// - Returns: return character type by using the enum in character class
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
    
    /// private method to choose a name for one character
    ///
    /// - Returns: return the chosen name and put it in the chosenNamesForCharacters array
    private func chooseCharacterName() -> String {
        print("\nNow give him his own name:\n")
        if let characterName = readLine(),
            characterName != "",
            nameIsUnique(chosenCharacterName: characterName) == false {
            chosenNamesForCharacters.append(characterName)
            return characterName
        } else {
            return chooseCharacterName()
        }
    }
    
    /// private method to verify if the chosen name already exist
    ///
    /// - Parameter chosenCharacterName: name chosen by the player
    /// - Returns: if the name is already exist, the boolean equals true and print a warning, else the name goes to the array
    private func nameIsUnique(chosenCharacterName: String) -> Bool {
        var choice = true
        if  !chosenNamesForCharacters.contains(chosenCharacterName) {
            choice = false
        } else {
            print("❌ \(chosenCharacterName) already exists ❌")
            choice = true
        }
        return choice
        
    }
    
    /// private method to change the weapon when the random chest appears
    ///
    /// - Parameter type: one character
    /// - Returns: return a new weapon
    private func changeWeapon(type: Character) -> Weapon {
        let attackWeapons = [Bow(), Nunchaku(), ChainSaw()]
        let randomIndex = Int(arc4random_uniform(UInt32(attackWeapons.count)))
        let newAttackWeapon = attackWeapons[randomIndex]
        let str = """
        \n 🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑
        You've got a new weapon: \(newAttackWeapon.name)
        🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑🔑\n
        """
        print(str)
        return newAttackWeapon
    }
    
    /// private method to change the healing tool when the random chest appears
    ///
    /// - Parameter type: Magus
    /// - Returns: return a new healing tool
    private func changeHealingTool(type: Character) -> Weapon {
        let healingTools = [MagicPotion(),MagicWand()]
        let randomIndex = Int(arc4random_uniform(UInt32(healingTools.count)))
        let newHealingTool = healingTools[randomIndex]
        let str = """
        \n✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨
        ✨✨ You've got a new tools to heal: \(newHealingTool.name)✨✨
        ✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨\n
        """
        print(str)
        return newHealingTool
    }
    
}

