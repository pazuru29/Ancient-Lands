//
//  Location.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

struct Location: Codable {
    let assetName: String
    let name: String
    let story: String
    let type: TypeOfLocation
    var nextLocations: [TypeOfLocation]
    let actions: [ActionType]
}
