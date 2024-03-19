//
//  ItemCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

class ItemCard {
    let assetName: String
    let name: String
    let description: String
    let type: ItemType
    
    init(assetName: String, name: String, description: String, type: ItemType) {
        self.assetName = assetName
        self.name = name
        self.description = description
        self.type = type
    }
}
