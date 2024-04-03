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
        [1: 2, 2: 2, 7: 4],
        [2: 3, 14: 1, 6: 4],
        [4: 2, 11: 1, 17: 1],
        [6: 5, 7: 2, 10: 1],
        [7: 4, 9: 1, 16: 1],
        [8: 1, 50: 3],
        [9: 1, 12: 1, 17: 1],
        [28: 10, 31: 5, 33: 5],
        [28: 15, 29: 10],
        [37: 10, 40: 5, 39: 5],
        [38: 10, 41: 5, 40: 5],
    ]
    
    static let dropFromAncientChest: [Dictionary<Int, Int>] = [
        [18: 1, 1: 3, 2: 2],
        [19: 1, 4: 3, 42: 1],
        [20: 1, 8: 1, 16: 1],
        [21: 1, 23: 1, 1: 2],
        [22: 1, 45: 1, 17: 1],
        [24: 1, 26: 1, 28: 10],
        [25: 1, 50: 5, 2: 3],
        [27: 1, 29: 5, 30: 10],
        [26: 1, 31: 10, 32: 5],
        [33: 10, 28: 15, 31: 5],
        [34: 1, 37: 10, 4: 3],
        [35: 1, 38: 5, 39: 10],
        [36: 1, 40: 10, 41: 5],
        [38: 10, 40: 5, 41: 5],
        [43: 1, 4: 3, 1: 3, 2: 3],
        [44: 1, 8: 1, 18: 1],
        [46: 1, 23: 1, 1: 1],
        [47: 1, 50: 10, 4: 3],
        [48: 1, 26: 1, 28: 10],
        [49: 1, 50: 5, 2: 3],
    ]
    
    static let dropAfterWinEasy: [Dictionary<Int, Int>] = [
        [1: 2, 2: 2, 7: 4],
        [2: 3, 14: 1, 6: 4],
        [4: 2, 11: 1, 17: 1],
        [6: 5, 7: 2, 10: 1],
        [7: 4, 9: 1, 16: 1],
        [8: 1, 50: 3],
        [9: 1, 12: 1, 17: 1],
        [26: 1, 31: 10, 32: 5],
        [21: 1, 23: 1, 1: 2],
        [28: 10, 31: 5, 33: 5],
        [28: 15, 29: 10],
        [37: 10, 40: 5, 39: 5],
        [38: 10, 41: 5, 40: 5],
    ]
    
    static let dropAfterWinMedium: [Dictionary<Int, Int>] = [
        [18: 1, 1: 3, 2: 2],
        [19: 1, 4: 3, 42: 1],
        [20: 1, 8: 1, 16: 1],
        [21: 1, 23: 1, 1: 2],
        [22: 1, 45: 1, 17: 1],
        [24: 1, 26: 1, 28: 10],
        [25: 1, 50: 5, 2: 3],
        [27: 1, 29: 5, 30: 10],
        [26: 1, 31: 10, 32: 5],
        [33: 10, 28: 15, 31: 5],
        [34: 1, 37: 10, 4: 3],
        [35: 1, 38: 5, 39: 10],
        [36: 1, 40: 10, 41: 5],
        [38: 10, 40: 5, 41: 5],
        [43: 1, 4: 3, 1: 3, 2: 3],
        [44: 1, 8: 1, 18: 1],
        [46: 1, 23: 1, 1: 1],
        [47: 1, 50: 10, 4: 3],
        [48: 1, 26: 1, 28: 10],
        [49: 1, 50: 5, 2: 3],
    ]
    
    static let dropAfterWinBoss: [Dictionary<Int, Int>] = [
        [19: 1, 4: 3, 42: 1],
        [20: 1, 8: 1, 16: 1],
        [21: 1, 22: 1, 1: 2],
        [22: 1, 45: 1, 17: 1],
        [27: 1, 29: 25, 30: 15],
        [27: 1, 31: 25, 32: 35],
        [34: 1, 37: 20, 4: 5, 41: 15],
        [35: 1, 38: 25, 39: 10, 40: 10],
        [43: 1, 4: 5, 1: 5, 2: 5],
        [44: 1, 22: 1, 20: 1],
        [46: 1, 22: 1, 1: 10],
        [47: 1, 50: 20, 4: 5],
        [48: 1, 27: 1, 28: 30],
        [49: 1, 50: 25, 2: 5],
    ]
    
    static let allCards: Array<any ItemCardModelProtocol> = [
        EffectItemCardModel(id: 1, assetName: "DefensePotion", name: "Defense Potion", description: "A potion that enhances the user's defensive capabilities.", type: .potion, effect: GameEffects(id: 101, value: 10, countOfRounds: 3, assetName: "defenseEffect", type: .buff, typeOfCharacteristic: .defense)),
        EffectItemCardModel(id: 2, assetName: "HealingPotion", name: "Healing Potion", description: "A magical elixir that restores health points to the user.", type: .potion,  effect: GameEffects(id: 102, value: 10, countOfRounds: 1, assetName: "dragon", type: .buff, typeOfCharacteristic: .hp)),
        EffectItemCardModel(id: 4, assetName: "PowerPotion", name: "Power Potion", description: "A potion that boosts the user's attack strength.", type: .potion,  effect: GameEffects(id: 103, value: 10, countOfRounds: 3, assetName: "powerEffect", type: .buff, typeOfCharacteristic: .attack)),
        
        ItemCardModel(id: 6, assetName: "Trap", name: "Trap", description: "A mechanism designed to catch unsuspecting foes.", type: .trap),
        EffectItemCardModel(id: 7, assetName: "PoisonTrap", name: "Poison Trap", description: "A trap that releases a poisonous substance upon activation.", type: .trap, effect: GameEffects(id: 104, value: 5, countOfRounds: 3, assetName: "poisonEffect", type: .debuff, typeOfCharacteristic: .hp)),
        
        ItemCardModel(id: 8, assetName: "AmuletOfLuck", name: "Amulet Of Luck", description: "An enchanted amulet believed to bring good fortune to its wearer.", type: .amplification),  // add chance of open chest
        ItemCardModel(id: 9, assetName: "AncientMask", name: "Ancient Mask", description: "A mysterious mask with ancient symbols engraved on it.", type: .amplification), // add for player to hp
        ItemCardModel(id: 10, assetName: "AncientMedal", name: "Ancient Medal", description: "A medal bestowed upon warriors of old for their valor in battle.", type: .amplification), // add attack to character
        ItemCardModel(id: 11, assetName: "BlazingRing", name: "Blazing Ring", description: "A ring imbued with the essence of fire, emanating a warm glow.", type: .amplification), // add attack to fire items
        ItemCardModel(id: 12, assetName: "MagicalHearth", name: "Magical Hearth", description: "A magical hearth that provides warmth and comfort to adventurers.", type: .amplification), // add attack to magic weapon
        ItemCardModel(id: 14, assetName: "NaturesBlessing", name: "Natures Blessing", description: "A blessing from nature, granting protection and vitality.", type: .amplification), // add chance to stelth
        ItemCardModel(id: 16, assetName: "SacredRing", name: "Sacred Ring", description: "A ring infused with sacred energies, warding off evil spirits.", type: .amplification), // add defense to character
        ItemCardModel(id: 17, assetName: "Torch", name: "Torch", description: "A handheld light source, guiding the way through dark dungeons.", type: .amplification), // add chance for the enemy to miss
        
        ValueItemCardModel(id: 18, assetName: "DefendersShield", name: "Defenders Shield", description: "A sturdy shield used by defenders to protect against enemy attacks.", type: .shield, value: 5, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 19, assetName: "ElectricShield", name: "Electric Shield", description: "A shield enchanted with electrical properties, shocking attackers on contact.", type: .shield, value: 10, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 20, assetName: "IceShield", name: "Ice Shield", description: "A shield encased in ice, capable of freezing incoming projectiles.", type: .shield, value: 10, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 21, assetName: "RoyalShield", name: "Royal Shield", description: "A shield adorned with royal emblems, signifying nobility and strength.", type: .shield, value: 20, typeOfCharacteristic: .defense),
        
        ValueItemCardModel(id: 22, assetName: "KolchugaArmor", name: "Kolchuga Armor", description: "Heavy armor fashioned from the tough hide of a legendary creature, offering unparalleled protection.", type: .armor, value: 8, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 23, assetName: "LeatherArmor", name: "Leather Armor", description: "Lightweight armor made from tanned leather, providing basic defense without hindering mobility.", type: .armor, value: 3, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 24, assetName: "WoolArmor", name: "Wool Armor", description: "Armor woven from magical wool fibers, offering both warmth and protection against the elements.", type: .armor, value: 5, typeOfCharacteristic: .defense),
        ValueItemCardModel(id: 25, assetName: "SorcerersArmor", name: "Sorcerers Armor", description: "Enchanted armor infused with mystical energies, enhancing the wearer's magical prowess.", type: .armor, value: 3, typeOfCharacteristic: .defense),
        
        ValueItemCardModel(id: 26, assetName: "Bow", name: "Bow", description: "A traditional ranged weapon consisting of a curved piece of wood or other flexible material, used to propel arrows towards targets.", type: .rangedWeapon, value: 5, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 27, assetName: "KingsBow", name: "King's Bow", description: "A majestic bow fit for royalty, crafted with precision and imbued with regal authority.", type: .rangedWeapon, value: 15, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 28, assetName: "Arrow", name: "Arrow", description: "A projectile designed to be fired from a bow, typically consisting of a shaft with a pointed head.", type: .ammo, value: 10, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 29, assetName: "ArrowOfDarkness", name: "Arrow Of Darkness", description: "An arrow infused with dark magic, capable of sapping the life force from its target upon impact.", type: .ammo, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 30, assetName: "DartingArrow", name: "Darting Arrow", description: "An arrow designed for swift and precise strikes, ideal for sniping targets from a distance.", type: .ammo, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 31, assetName: "FireArrow", name: "Fire Arrow", description: "An arrow tipped with flammable material, capable of igniting upon contact and causing fiery devastation.", type: .ammo, value: 25, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 32, assetName: "PoisonArrow", name: "Poison Arrow", description: "An arrow coated with deadly toxins, inflicting poison upon those it strikes.", type: .ammo, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 33, assetName: "VampireArrow", name: "Vampire Arrow", description: "An arrow imbued with vampiric essence, draining the life force of its target to heal the wielder.", type: .ammo, value: 15, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 34, assetName: "BookOfCurses", name: "Book Of Curses", description: "A forbidden tome filled with dark incantations and malevolent spells, capable of bringing misfortune upon those who dare to open its pages.", type: .magicWeapon, value: 30, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 35, assetName: "TheSummonersStaff", name: "The Summoner's Staff", description: "A mystical staff wielded by powerful sorcerers, channeling arcane energies to summon otherworldly beings and cast devastating spells.", type: .magicWeapon, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 36, assetName: "WizardCane", name: "Wizard Cane", description: "An elegant cane favored by wizards and enchanters, its seemingly mundane appearance belies its potent magical capabilities.", type: .magicWeapon, value: 15, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 37, assetName: "ElectricMagiciansBall", name: "Electric Magician's Ball", description: "A spherical artifact crackling with electrical energy, utilized by skilled magicians to unleash devastating lightning bolts upon their foes.", type: .spell, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 38, assetName: "FireballMagician", name: "Fireball Magician", description: "A skilled practitioner of pyromancy, wielding the power to conjure fiery orbs that engulf their targets in searing flames.", type: .spell, value: 10, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 39, assetName: "Ghoststorm", name: "Ghoststorm", description: "A spectral tempest summoned from the realm of the dead, enveloping enemies in an ethereal shroud that saps their strength and vitality.", type: .spell, value: 30, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 40, assetName: "Ignition", name: "Ignition", description: "An incantation of ignition, unleashing a torrent of magical fire upon foes and igniting everything in its path.", type: .spell, value: 25, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 41, assetName: "MagiciansIceBall", name: "Magician's Ice Ball", description: "A conjured sphere of ice infused with frost magic, capable of freezing enemies solid upon impact.", type: .spell, value: 10, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 42, assetName: "DaggerOfTheDodger", name: "Dagger Of The Dodger", description: "A finely crafted dagger favored by agile rogues and nimble assassins, allowing for swift strikes and deft maneuvers in combat.", type: .meleeWeapon, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 43, assetName: "IceSpear", name: "Ice Spear", description: "A spear forged from enchanted ice, its icy tip capable of piercing through armor and freezing foes upon contact.", type: .meleeWeapon, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 44, assetName: "ShadowSword", name: "Shadow Sword", description: "A blade infused with dark energies from the shadow realm, empowering its wielder to strike with the unseen force of darkness.", type: .meleeWeapon, value: 10, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 45, assetName: "SharpDagger", name: "Sharp Dagger", description: "A razor-sharp dagger crafted for precision strikes, its keen edge capable of slicing through flesh and armor alike with ease.", type: .meleeWeapon, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 46, assetName: "ThunderHammer", name: "Thunder Hammer", description: "A massive hammer crackling with electrical energy, wielded by mighty warriors to unleash thunderous blows that shatter defenses and stun foes.", type: .meleeWeapon, value: 30, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 47, assetName: "VampireDagger", name: "Vampire Dagger", description: "A cursed dagger infused with vampiric essence, draining the life force of those it wounds to heal its wielder.", type: .meleeWeapon, value: 15, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 48, assetName: "WarriorsHammer", name: "Warrior's Hammer", description: "A sturdy hammer wielded by seasoned warriors, its weight and force capable of pulverizing foes and breaking through even the toughest armor.", type: .meleeWeapon, value: 20, typeOfCharacteristic: .attack),
        ValueItemCardModel(id: 49, assetName: "WarriorsSword", name: "Warrior's Sword", description: "A trusty sword carried by warriors into battle, its blade honed to a keen edge and ready to cleave through enemies with righteous fury.", type: .meleeWeapon, value: 10, typeOfCharacteristic: .attack),
        
        ValueItemCardModel(id: 50, assetName: "BreakingGarnet", name: "Breaking Garnet", description: "A gemstone infused with destructive energies, capable of unleashing a devastating explosion upon impact, obliterating anything caught in its blast radius.", type: .grenade, value: 25, typeOfCharacteristic: .attack),
    ]
    
    static let poisonEffect = GameEffects(id: 104, value: 5, countOfRounds: 3, assetName: "poisonEffect", type: .debuff, typeOfCharacteristic: .hp)
}
