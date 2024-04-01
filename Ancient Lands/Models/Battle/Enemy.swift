//
//  Enemy.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 27.03.2024.
//

import Foundation

struct Enemy: Codable {
    let assetName: String
    let name: String
    let typeOfLocation: TypeOfLocation
    let hp: Int
    let attacks: [Int] // to upper power of attack exp: 3,5,7
    var debuffs: [GameEffects]
}
