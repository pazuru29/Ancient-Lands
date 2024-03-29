//
//  Supplement.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

struct Supplement: Codable {
    let assetName: String?
    let name: String?
    var story: String
    var actions: [ActionType]
    
    init(assetName: String? = nil, name: String? = nil, story: String, actions: [ActionType]) {
        self.assetName = assetName
        self.name = name
        self.story = story
        self.actions = actions
    }
    
    func copyWith(assetName: String? = nil, name: String? = nil, story: String? = nil, actions: [ActionType]? = nil) -> Supplement {
        Supplement(assetName: assetName ?? self.assetName, name: name ?? self.name, story: story ?? self.story, actions: actions ?? self.actions)
    }
}
