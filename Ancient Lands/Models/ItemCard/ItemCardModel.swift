//
//  ItemCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

struct ItemCardModel: Hashable, Codable {
    let id: Int
    let assetName: String
    let name: String
    let description: String
    let type: ItemType
    
    init(id: Int, assetName: String, name: String, description: String, type: ItemType) {
        self.id = id
        self.assetName = assetName
        self.name = name
        self.description = description
        self.type = type
    }
    
    static func == (lhs: ItemCardModel, rhs: ItemCardModel) -> Bool {
        return lhs.id == rhs.id && lhs.assetName == rhs.assetName && lhs.name == rhs.name && lhs.description == rhs.description && lhs.type == rhs.type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(assetName)
        hasher.combine(name)
        hasher.combine(description)
        hasher.combine(type)
    }
}
