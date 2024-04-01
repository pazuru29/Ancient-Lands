//
//  CardStorage.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import Foundation

struct CardStorage {
    // ID - Count
    static let knightSet: Dictionary<Int, Int> = [
        49: 1,
        18: 1,
        50: 3,
        4: 3,
        23: 1,
    ]
    
    static let elfSet: Dictionary<Int, Int> = [
        26: 1,
        28: 25,
        32: 10,
        6: 3,
        7: 1,
    ]
    
    static let wizardSet: Dictionary<Int, Int> = [
        36: 1,
        38: 10,
        41: 5,
        2: 3,
        1: 1,
    ]
    
    static let dropFromChest: [Dictionary<Int, Int>] = [
//        [1: 1, 2: 2, 28: 5],
//        [1: 2, 28: 10, 6: 1],
//        [6: 3, 7: 1],
//        [17: 1, 8: 10],
//        [16: 1, 9: 10],
//        [15: 1, 10: 10],
//        [14: 1, 11: 10],
        [11: 1, 16: 3, 22: 1, 18: 1, 34: 1, 37: 10, 45: 1, 2: 3, 4: 1, 27: 1, 46: 1, 21: 1],
    ]
    
    static let dropFromAncientChest: [Dictionary<Int, Int>] = [
//        [27: 1, 2: 2, 28: 5],
//        [2: 3, 28: 25, 6: 3],
//        [40: 5, 36: 1],
//        [44: 1, 1: 3],
//        [8: 1, 12: 3],
//        [9: 1, 13: 3],
//        [10: 1, 14: 3],
        [11: 1, 16: 3, 22: 1, 18: 1, 34: 1, 37: 10, 45: 1, 2: 3, 4: 1, 27: 1, 46: 1, 21: 1],
    ]
    
    static let dropAfterWinEasy: [Dictionary<Int, Int>] = [
//        [27: 1, 2: 2, 28: 5],
//        [2: 3, 28: 25, 6: 3],
//        [40: 5, 36: 1],
//        [44: 1, 1: 3],
//        [8: 1, 12: 3],
//        [9: 1, 13: 3],
//        [10: 1, 14: 3],
        [11: 1, 16: 3, 22: 1, 18: 1, 34: 1, 37: 10, 45: 1, 2: 3, 4: 1, 27: 1, 46: 1, 21: 1],
    ]
    
    static let dropAfterWinMedium: [Dictionary<Int, Int>] = [
//        [27: 1, 2: 2, 28: 5],
//        [2: 3, 28: 25, 6: 3],
//        [40: 5, 36: 1],
//        [44: 1, 1: 3],
//        [8: 1, 12: 3],
//        [9: 1, 13: 3],
//        [10: 1, 14: 3],
        [11: 1, 16: 3, 22: 1, 18: 1, 34: 1, 37: 10, 45: 1, 2: 3, 4: 1, 27: 1, 46: 1, 21: 1],
    ]
    
    static let dropAfterWinBoss: [Dictionary<Int, Int>] = [
//        [27: 1, 2: 2, 28: 5],
//        [2: 3, 28: 25, 6: 3],
//        [40: 5, 36: 1],
//        [44: 1, 1: 3],
//        [8: 1, 12: 3],
//        [9: 1, 13: 3],
//        [10: 1, 14: 3],
        [11: 1, 16: 3, 22: 1, 18: 1, 34: 1, 37: 10, 45: 1, 2: 3, 4: 1, 27: 1, 46: 1, 21: 1],
    ]
    
    static let allCards: Array<any ItemCardModelProtocol> = [
        EffectItemCardModel(id: 1, assetName: "DefensePotion", name: "Defense Potion", description: "", type: .potion, effect: GameEffects(id: 101, value: 10, countOfRounds: 3, assetName: "defenseEffect", type: .buff, typeOfCharacteristic: .defense)),
        EffectItemCardModel(id: 2, assetName: "HealingPotion", name: "Healing Potion", description: "", type: .potion,  effect: GameEffects(id: 102, value: 10, countOfRounds: 1, assetName: "dragon", type: .buff, typeOfCharacteristic: .hp)),
        EffectItemCardModel(id: 4, assetName: "PowerPotion", name: "Power Potion", description: "", type: .potion,  effect: GameEffects(id: 103, value: 10, countOfRounds: 3, assetName: "powerEffect", type: .buff, typeOfCharacteristic: .attack)),
        
        ItemCardModel(id: 6, assetName: "Trap", name: "Trap", description: "", type: .trap),
        EffectItemCardModel(id: 7, assetName: "PoisonTrap", name: "Poison Trap", description: "", type: .trap, effect: GameEffects(id: 104, value: 5, countOfRounds: 3, assetName: "poisonEffect", type: .debuff, typeOfCharacteristic: .hp)),
        
        ItemCardModel(id: 8, assetName: "AmuletOfLuck", name: "Amulet Of Luck", description: "", type: .amplification), // add chance of open chest
        ItemCardModel(id: 9, assetName: "AncientMask", name: "Ancient Mask", description: "", type: .amplification), // add for player to hp
        ItemCardModel(id: 10, assetName: "AncientMedal", name: "Ancient Medal", description: "", type: .amplification), // add attack to character
        ItemCardModel(id: 11, assetName: "BlazingRing", name: "Blazing Ring", description: "", type: .amplification), // add attack to fire items
        ItemCardModel(id: 12, assetName: "MagicalHearth", name: "Magical Hearth", description: "", type: .amplification), // add attack to magic weapon
        ItemCardModel(id: 14, assetName: "NaturesBlessing", name: "Natures Blessing", description: "", type: .amplification), // add chance to stelth
        ItemCardModel(id: 16, assetName: "SacredRing", name: "Sacred Ring", description: "", type: .amplification), // add defense to character
        ItemCardModel(id: 17, assetName: "Torch", name: "Torch", description: "", type: .amplification), // add chance for the enemy to miss
        
        ValueItemCardModel(id: 18, assetName: "DefendersShield", name: "Defenders Shield", description: "", type: .shield, value: 5, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 19, assetName: "ElectricShield", name: "Electric Shield", description: "", type: .shield, value: 10, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 20, assetName: "IceShield", name: "Ice Shield", description: "", type: .shield, value: 10, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 21, assetName: "RoyalShield", name: "Royal Shield", description: "", type: .shield, value: 20, typeOfCharacteristic: .defense),
        
        ValueItemCardModel(id: 22, assetName: "KolchugaArmor", name: "Kolchuga Armor", description: "", type: .armor, value: 8, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 23, assetName: "LeatherArmor", name: "Leather Armor", description: "", type: .armor, value: 3, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 24, assetName: "WoolArmor", name: "Wool Armor", description: "", type: .armor, value: 5, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 25, assetName: "SorcerersArmor", name: "Sorcerers Armor", description: "", type: .armor, value: 3, typeOfCharacteristic: .defense),
        
        ValueItemCardModel(id: 26, assetName: "Bow", name: "Bow", description: "", type: .rangedWeapon, value: 5, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 27, assetName: "KingsBow", name: "King's Bow", description: "", type: .rangedWeapon, value: 15, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 28, assetName: "Arrow", name: "Arrow", description: "", type: .ammo, value: 10, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 29, assetName: "ArrowOfDarkness", name: "Arrow Of Darkness", description: "", type: .ammo, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 30, assetName: "DartingArrow", name: "Darting Arrow", description: "", type: .ammo, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 31, assetName: "FireArrow", name: "Fire Arrow", description: "", type: .ammo, value: 25, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 32, assetName: "PoisonArrow", name: "Poison Arrow", description: "", type: .ammo, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 33, assetName: "VampireArrow", name: "Vampire Arrow", description: "", type: .ammo, value: 15, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 34, assetName: "BookOfCurses", name: "Book Of Curses", description: "", type: .magicWeapon, value: 30, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 35, assetName: "TheSummonersStaff", name: "The Summoners Staff", description: "", type: .magicWeapon, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 36, assetName: "WizardCane", name: "Wizard Cane", description: "", type: .magicWeapon, value: 15, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 37, assetName: "ElectricMagiciansBall", name: "Electric Magician's Ball", description: "", type: .spell, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 38, assetName: "FireballMagician", name: "Fireball Magician", description: "", type: .spell, value: 10, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 39, assetName: "Ghoststorm", name: "Ghoststorm", description: "", type: .spell, value: 30, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 40, assetName: "Ignition", name: "Ignition", description: "", type: .spell, value: 25, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 41, assetName: "MagiciansIceBall", name: "Magician's Ice Ball", description: "", type: .spell, value: 10, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 42, assetName: "DaggerOfTheDodger", name: "Dagger Of The Dodger", description: "", type: .meleeWeapon, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 43, assetName: "IceSpear", name: "Ice Spear", description: "", type: .meleeWeapon, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 44, assetName: "ShadowSword", name: "Shadow Sword", description: "", type: .meleeWeapon, value: 10, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 45, assetName: "SharpDagger", name: "Sharp Dagger", description: "", type: .meleeWeapon, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 46, assetName: "ThunderHammer", name: "Thunder Hammer", description: "", type: .meleeWeapon, value: 30, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 47, assetName: "VampireDagger", name: "Vampire Dagger", description: "", type: .meleeWeapon, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 48, assetName: "WarriorsHammer", name: "Warriors Hammer", description: "", type: .meleeWeapon, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 49, assetName: "WarriorsSword", name: "Warriors Sword", description: "", type: .meleeWeapon, value: 10, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 50, assetName: "BreakingGarnet", name: "Breaking Garnet", description: "", type: .grenade, value: 25, typeOfCharacteristic: .attack),
    ]
    
    static let poisonEffect = GameEffects(id: 104, value: 5, countOfRounds: 3, assetName: "poisonEffect", type: .debuff, typeOfCharacteristic: .hp)
}
