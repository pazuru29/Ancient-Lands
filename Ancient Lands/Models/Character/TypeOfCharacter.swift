//
//  TypeOfCharacter.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

enum TypeOfCharacter: CaseIterable, Codable {
    case knightWm
    case knight
    case elfWm
    case elf
    case wizardWm
    case wizard
    
    func getCharacteristic() -> TypeOfCharacterStruct {
        switch self {
        case .knight:
            return TypeOfCharacterStruct(name: "Knight", assetName: "Knight", characterEnhancement: ["+20 to attack indoors,","+20 to defense indoors,"], passiveSkills: ["+10 to melee weapon attack,","when striking with a weapon, there is a chance (10%) to make a critical hit (+30%)."], hp: 70, attack: 40, defense: 30, dexterity: 10, stealth: 20)
        case .elf:
            return TypeOfCharacterStruct(name: "Elf", assetName: "Elf", characterEnhancement: ["+10 to defense in forest terrain,", "+20 to attack in forest terrain."], passiveSkills: ["+10 to ranged weapon attack,", "when fired there is a chance that the used arrow will not be taken away."], hp: 40, attack: 30, defense: 30, dexterity: 40, stealth: 20)
        case .wizard:
            return TypeOfCharacterStruct(name: "Wizard", assetName: "Wizard", characterEnhancement: ["+10 to cave defense,", "+10 to attack in the cave."], passiveSkills: ["+10 to healing"], hp: 30, attack: 60, defense: 30, dexterity: 20, stealth: 20)
        case .knightWm:
            return TypeOfCharacterStruct(name: "Knight", assetName: "KnightWm", characterEnhancement: ["+20 to attack indoors,","+20 to defense indoors,"], passiveSkills: ["+10 to melee weapon attack,","when striking with a weapon, there is a chance (10%) to make a critical hit (+30%)."], hp: 70, attack: 40, defense: 30, dexterity: 10, stealth: 20)
        case .elfWm:
            return TypeOfCharacterStruct(name: "Elf", assetName: "ElfWm", characterEnhancement: ["+10 to defense in forest terrain,", "+20 to attack in forest terrain."], passiveSkills: ["+10 to ranged weapon attack,", "when fired there is a chance that the used arrow will not be taken away."], hp: 40, attack: 30, defense: 30, dexterity: 40, stealth: 20)
        case .wizardWm:
            return TypeOfCharacterStruct(name: "Wizard", assetName: "WizardWm", characterEnhancement: ["+10 to cave defense,", "+10 to attack in the cave."], passiveSkills: ["+10 to healing"], hp: 30, attack: 60, defense: 30, dexterity: 20, stealth: 20)
        }
    }
}

struct TypeOfCharacterStruct: Equatable, Codable {
    let name: String
    let assetName: String
    let characterEnhancement: Array<String>
    let passiveSkills: Array<String>
    var hp: Int
    var attack: Int
    var defense: Int
    let dexterity: Int
    let stealth: Int
    
    func copyWith(name: String? = nil, assetName: String? = nil, characterEnhancement: Array<String>? = nil, passiveSkills: Array<String>? = nil, hp: Int? = nil, attack: Int? = nil, defense: Int? = nil, dexterity: Int? = nil, stealth: Int? = nil) -> TypeOfCharacterStruct {
        TypeOfCharacterStruct(name: name ?? self.name, assetName: assetName ?? self.assetName, characterEnhancement: characterEnhancement ?? self.characterEnhancement, passiveSkills: passiveSkills ?? self.passiveSkills, hp: hp ?? self.hp, attack: attack ?? self.attack, defense: defense ?? self.defense, dexterity: dexterity ?? self.dexterity, stealth: stealth ?? self.stealth)
    }
}
