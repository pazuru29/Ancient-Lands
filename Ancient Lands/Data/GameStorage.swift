//
//  LocationStorage.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

struct GameStorage {
    static let startLocations: [Location] = [
        Location(assetName: "CastleSurroundings", name: "Castle Surroundings", story: "Waking up in the camp outside the castle, you decide to find out the reason for the strange silence that has enveloped the surrounding area. You leave the camp and head in the opposite direction, deeper into the forest.", types: [.forest], actions: [.lookAround,.moveOn]),
    ]
    
    static let gameLocations: [Location] = [
        Location(assetName: "TrailInTheWoods", name: "Trail In The Woods", story: "You're walking down a path in the woods.", types: [.forest], actions: [.lookAround, .moveOn]),
    ]
    
    static let somebody = Supplement(assetName: "Somebody", name: "Somebody", story: "You're detecting someone.", actions: [.useTheTrap, .attack, .escape])
    
    static let chests: [Supplement] = [
        Supplement(assetName: "AncientChest", name: "Ancient Chest", story: "You have discovered an ancient chest, travelers know they are more valuable as ancient warriors hid their weapons in them.", actions: [.examine, .open, .passBy]),
        Supplement(assetName: "Chest", name: "Chest", story: "You have discovered a chest, such chests are usually used to hide food and valuables. Perhaps its owner is nearby.", actions: [.examine, .open, .passBy]),
    ]
}
