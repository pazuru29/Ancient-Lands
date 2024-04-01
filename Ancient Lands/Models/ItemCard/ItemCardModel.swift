//
//  ItemCard.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

protocol ItemCardModelProtocol: Hashable, Codable {
    var id: Int { get set }
    var assetName: String { get set }
    var name: String { get set }
    var description: String { get set }
    var type: ItemType { get set }
}

struct ItemCardModel: ItemCardModelProtocol, Hashable, Codable {
    var id: Int
    var assetName: String
    var name: String
    var description: String
    var type: ItemType
    
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

struct EffectItemCardModel: ItemCardModelProtocol, Hashable, Codable {
    var id: Int
    var assetName: String
    var name: String
    var description: String
    var type: ItemType
    var effect: GameEffects
    
    static func == (lhs: EffectItemCardModel, rhs: EffectItemCardModel) -> Bool {
        return lhs.id == rhs.id && lhs.assetName == rhs.assetName && lhs.name == rhs.name && lhs.description == rhs.description && lhs.type == rhs.type && lhs.effect == rhs.effect
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(assetName)
        hasher.combine(name)
        hasher.combine(description)
        hasher.combine(type)
        hasher.combine(effect)
    }
}

struct ValueItemCardModel: ItemCardModelProtocol, Hashable, Codable {
    var id: Int
    var assetName: String
    var name: String
    var description: String
    var type: ItemType
    var value: Int
    var typeOfCharacteristic: TypeOfCharacteristic
    
    static func == (lhs: ValueItemCardModel, rhs: ValueItemCardModel) -> Bool {
        return lhs.id == rhs.id && lhs.assetName == rhs.assetName && lhs.name == rhs.name && lhs.description == rhs.description && lhs.type == rhs.type && lhs.value == rhs.value && lhs.typeOfCharacteristic == rhs.typeOfCharacteristic
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(assetName)
        hasher.combine(name)
        hasher.combine(description)
        hasher.combine(type)
        hasher.combine(value)
        hasher.combine(typeOfCharacteristic)
    }
}
