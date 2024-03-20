//
//  TypeOfCharacter.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

enum TypeOfCharacter: CaseIterable {
    case knightWm
    case knight
    case elfWm
    case elf
    case wizardWm
    case wizard
    
    func getCharacteristic() -> TypeOfCharacterStruct {
        switch self {
        case .knight:
            return TypeOfCharacterStruct(name: "Knight", assetName: "Knight", characterEnhancement: ["+20 to attack indoors,","+20 to defense indoors,","+10 to agility in open terrain."], passiveSkills: ["+10 to melee weapon attack,","when striking with a weapon, there is a chance (10%) to make a critical hit (+30%)."], hp: 70, attack: 40, defense: 30, dexterity: 10, stealth: 20)
        case .elf:
            return TypeOfCharacterStruct(name: "Elf", assetName: "Elf", characterEnhancement: ["+3 to defense in forest terrain,", "+4 to stealth in forest terrain,", "+2 to dexterity in forest terrain."], passiveSkills: ["+2 to ranged weapon attack,", "when fired there is a chance that the used arrow will not be taken away."], hp: 40, attack: 30, defense: 30, dexterity: 40, stealth: 20)
        case .wizard:
            return TypeOfCharacterStruct(name: "Wizard", assetName: "Wizard", characterEnhancement: ["+10 to cave defense,","+30 to stealth in the cave,","+10 to dexterity in the cave."], passiveSkills: ["+30 to healing,","when using lightning magic, there is a chance to paralyze the enemy (15%),","when using fire magic, there is a chance to attack with eternal flame (the opponent is burned to the ground) (3%)."], hp: 30, attack: 60, defense: 30, dexterity: 20, stealth: 20)
        case .knightWm:
            return TypeOfCharacterStruct(name: "Knight", assetName: "KnightWm", characterEnhancement: ["+20 to attack indoors,","+20 to defense indoors,","+10 to agility in open terrain."], passiveSkills: ["+10 to melee weapon attack,","when striking with a weapon, there is a chance (10%) to make a critical hit (+30%)."], hp: 70, attack: 40, defense: 30, dexterity: 10, stealth: 20)
        case .elfWm:
            return TypeOfCharacterStruct(name: "Elf", assetName: "ElfWm", characterEnhancement: ["+3 to defense in forest terrain,", "+4 to stealth in forest terrain,", "+2 to dexterity in forest terrain."], passiveSkills: ["+2 to ranged weapon attack,", "when fired there is a chance that the used arrow will not be taken away."], hp: 40, attack: 30, defense: 30, dexterity: 40, stealth: 20)
        case .wizardWm:
            return TypeOfCharacterStruct(name: "Wizard", assetName: "WizardWm", characterEnhancement: ["+10 to cave defense,","+30 to stealth in the cave,","+10 to dexterity in the cave."], passiveSkills: ["+30 to healing,","when using lightning magic, there is a chance to paralyze the enemy (15%),","when using fire magic, there is a chance to attack with eternal flame (the opponent is burned to the ground) (3%)."], hp: 30, attack: 60, defense: 30, dexterity: 20, stealth: 20)
        }
    }
}

struct TypeOfCharacterStruct: Equatable {
    let name: String
    let assetName: String
    let characterEnhancement: Array<String>
    let passiveSkills: Array<String>
    let hp: Int
    let attack: Int
    let defense: Int
    let dexterity: Int
    let stealth: Int
}