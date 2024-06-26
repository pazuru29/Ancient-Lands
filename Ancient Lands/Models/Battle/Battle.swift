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
    //MARK: Battle
    let battleType: TypeOfEnemy
    
    //MARK: step of round
    var step: TypeStep
    
    //MARK: Enemy
    var enemy: Enemy
    var currentEnemyHp:Int
    
    //MARK: Player
    var currentPlayerHp: Int
    var playerEffects: [GameEffects]
    var currentPlayCards: [ValueItemCardModel]
    
    //MARK: Chest
    let chest: ChestType?
}
