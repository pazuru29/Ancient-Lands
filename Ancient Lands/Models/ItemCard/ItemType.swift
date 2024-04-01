//
//  ItemType.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

enum ItemType: String, Codable, CaseIterable {
    case potion = "Potions"
    case trap = "Traps"
    case amplification = "Amplifications"
    case shield = "Shields"
    case armor = "Armor"
    case rangedWeapon = "Ranged Weapon"
    case ammo = "Ammo"
    case magicWeapon = "Magic Weapon"
    case spell = "Spells"
    case meleeWeapon = "Melee Weapon"
    case grenade = "Grenades"
    case resource = "Resources"
}
