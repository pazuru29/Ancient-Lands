//
//  Battle.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

enum ChestType: Codable {
    case ancientChest
    case chest
}

struct Battle: Codable {
    //MARK: step of round
    let step: TypeStep
    
    //MARK: Enemy
    let enemy: Enemy
    let currentEnemyHp:Int
    
    //MARK: Player
    let playerHp: Int
    let effects: [GameEffects]
    let currentPlayCards: [ItemCardModel]
    
    //MARK: Chest
    let chest: ChestType?
}
