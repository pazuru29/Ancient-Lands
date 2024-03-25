//
//  Supplement.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

struct Supplement: Codable {
    let assetName: String
    let name: String
    let story: String
    let actions: [ActionType]
}
