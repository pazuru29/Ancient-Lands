//
//  GameEffects.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

enum TypeOfEffect: Codable {
    case buff
    case debuff
}

enum TypeOfCharacteristic: Codable {
    case hp
    case attack
    case defense
    case dexterity
    case stealth
}

struct GameEffects: Hashable, Codable {
    let id: Int
    let value: Int
    var countOfRounds: Int
    let assetName: String
    let type: TypeOfEffect
    let typeOfCharacteristic: TypeOfCharacteristic
}
