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
        [11: 1, 15: 3, 22: 1, 18: 1, 34: 1, 37: 10, 45: 1, 2: 3, 4: 1, 27: 1, 46: 1, 21: 1],
    ]
    
    static let dropFromAncientChest: [Dictionary<Int, Int>] = [
//        [27: 1, 2: 2, 28: 5],
//        [2: 3, 28: 25, 6: 3],
//        [40: 5, 36: 1],
//        [44: 1, 1: 3],
//        [8: 1, 12: 3],
//        [9: 1, 13: 3],
//        [10: 1, 14: 3],
        [11: 1, 15: 3, 22: 1, 18: 1, 34: 1, 37: 10, 45: 1, 2: 3, 4: 1, 27: 1, 46: 1, 21: 1],
    ]
    
    static let allCards: Array<any ItemCardModelProtocol> = [
        PotionItemCardModel(id: 1, assetName: "DefensePotion", name: "Defense Potion", description: "", type: .potion, effect: GameEffects(id: 101, value: 10, countOfRounds: 3, assetName: "dragon", type: .buff, typeOfCharacteristic: .defense)),
        PotionItemCardModel(id: 2, assetName: "HealingPotion", name: "Healing Potion", description: "", type: .potion,  effect: GameEffects(id: 102, value: 10, countOfRounds: 1, assetName: "dragon", type: .buff, typeOfCharacteristic: .hp)),
        PotionItemCardModel(id: 4, assetName: "PowerPotion", name: "Power Potion", description: "", type: .potion,  effect: GameEffects(id: 103, value: 10, countOfRounds: 3, assetName: "dragon", type: .buff, typeOfCharacteristic: .attack)),
        
        ItemCardModel(id: 6, assetName: "Trap", name: "Trap", description: "", type: .trap),
        ItemCardModel(id: 7, assetName: "PoisonTrap", name: "Poison Trap", description: "", type: .trap),
        
        ItemCardModel(id: 8, assetName: "AmuletOfLuck", name: "Amulet Of Luck", description: "", type: .amplification),
        ItemCardModel(id: 9, assetName: "AncientMask", name: "Ancient Mask", description: "", type: .amplification),
        ItemCardModel(id: 10, assetName: "AncientMedal", name: "Ancient Medal", description: "", type: .amplification),
        ItemCardModel(id: 11, assetName: "BlazingRing", name: "Blazing Ring", description: "", type: .amplification),
        ItemCardModel(id: 12, assetName: "MagicalHearth", name: "Magical Hearth", description: "", type: .amplification),
        ItemCardModel(id: 13, assetName: "MaskOfTheMadman", name: "Mask Of The Madman", description: "", type: .amplification),
        ItemCardModel(id: 14, assetName: "NaturesBlessing", name: "Natures Blessing", description: "", type: .amplification),
        ItemCardModel(id: 15, assetName: "RavenEye", name: "Raven Eye", description: "", type: .amplification),
        ItemCardModel(id: 16, assetName: "SacredRing", name: "Sacred Ring", description: "", type: .amplification),
        ItemCardModel(id: 17, assetName: "Torch", name: "Torch", description: "", type: .amplification),
        
        ItemCardModel(id: 18, assetName: "DefendersShield", name: "Defenders Shield", description: "", type: .shield),
        ItemCardModel(id: 19, assetName: "ElectricShield", name: "Electric Shield", description: "", type: .shield),
        ItemCardModel(id: 20, assetName: "IceShield", name: "Ice Shield", description: "", type: .shield),
        ItemCardModel(id: 21, assetName: "RoyalShield", name: "Royal Shield", description: "", type: .shield),
        
        ItemCardModel(id: 22, assetName: "KolchugaArmor", name: "Kolchuga Armor", description: "", type: .armor),
        ItemCardModel(id: 23, assetName: "LeatherArmor", name: "Leather Armor", description: "", type: .armor),
        ItemCardModel(id: 24, assetName: "WoolArmor", name: "Wool Armor", description: "", type: .armor),
        ItemCardModel(id: 25, assetName: "SorcerersArmor", name: "Sorcerers Armor", description: "", type: .armor),
        
        ItemCardModel(id: 26, assetName: "Bow", name: "Bow", description: "", type: .rangedWeapon),
        ItemCardModel(id: 27, assetName: "KingsBow", name: "King's Bow", description: "", type: .rangedWeapon),
        
        ItemCardModel(id: 28, assetName: "Arrow", name: "Arrow", description: "", type: .ammo),
        ItemCardModel(id: 29, assetName: "ArrowOfDarkness", name: "Arrow Of Darkness", description: "", type: .ammo),
        ItemCardModel(id: 30, assetName: "DartingArrow", name: "Darting Arrow", description: "", type: .ammo),
        ItemCardModel(id: 31, assetName: "FireArrow", name: "Fire Arrow", description: "", type: .ammo),
        ItemCardModel(id: 32, assetName: "PoisonArrow", name: "Poison Arrow", description: "", type: .ammo),
        ItemCardModel(id: 33, assetName: "VampireArrow", name: "Vampire Arrow", description: "", type: .ammo),
        
        ItemCardModel(id: 34, assetName: "BookOfCurses", name: "Book Of Curses", description: "", type: .magicWeapon),
        ItemCardModel(id: 35, assetName: "TheSummonersStaff", name: "The Summoners Staff", description: "", type: .magicWeapon),
        ItemCardModel(id: 36, assetName: "WizardCane", name: "Wizard Cane", description: "", type: .magicWeapon),
        
        ItemCardModel(id: 37, assetName: "ElectricMagiciansBall", name: "Electric Magician's Ball", description: "", type: .spell),
        ItemCardModel(id: 38, assetName: "FireballMagician", name: "Fireball Magician", description: "", type: .spell),
        ItemCardModel(id: 39, assetName: "Ghoststorm", name: "Ghoststorm", description: "", type: .spell),
        ItemCardModel(id: 40, assetName: "Ignition", name: "Ignition", description: "", type: .spell),
        ItemCardModel(id: 41, assetName: "MagiciansIceBall", name: "Magician's Ice Ball", description: "", type: .spell),
        
        ItemCardModel(id: 42, assetName: "DaggerOfTheDodger", name: "Dagger Of The Dodger", description: "", type: .meleeWeapon),
        ItemCardModel(id: 43, assetName: "IceSpear", name: "Ice Spear", description: "", type: .meleeWeapon),
        ItemCardModel(id: 44, assetName: "ShadowSword", name: "Shadow Sword", description: "", type: .meleeWeapon),
        ItemCardModel(id: 45, assetName: "SharpDagger", name: "Sharp Dagger", description: "", type: .meleeWeapon),
        ItemCardModel(id: 46, assetName: "ThunderHammer", name: "Thunder Hammer", description: "", type: .meleeWeapon),
        ItemCardModel(id: 47, assetName: "VampireDagger", name: "Vampire Dagger", description: "", type: .meleeWeapon),
        ItemCardModel(id: 48, assetName: "WarriorsHammer", name: "Warriors Hammer", description: "", type: .meleeWeapon),
        ItemCardModel(id: 49, assetName: "WarriorsSword", name: "Warriors Sword", description: "", type: .meleeWeapon),
        
        ItemCardModel(id: 50, assetName: "BreakingGarnet", name: "Breaking Garnet", description: "", type: .grenade),
    ]
}
