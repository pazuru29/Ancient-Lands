//
//  Battle.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

struct Battle: Codable {
    //MARK: step of round
    let step: TypeStep
    
    //MARK: Enemy
    let enemy: TypeOfEnemy
    let enemyHp:Int
    
    //MARK: Player
    let playerHp: Int
    let effects: [GameEffects]
    let currentPlayCards: [ItemCardModel]
}
