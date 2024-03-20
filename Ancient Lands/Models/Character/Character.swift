//
//  Character.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

struct Character {
    let type: TypeOfCharacter
    let name: String
    let equipment: Equipment
    let inventory: Array<(Int, ItemCardModel)>
    
    func copyWith(type: TypeOfCharacter? = nil, name: String? = nil, equipment: Equipment? = nil, inventory: Array<(Int, ItemCardModel)>? = nil) -> Character {
        return Character(type: type ?? self.type, name: name ?? self.name, equipment: equipment ?? self.equipment, inventory: inventory ?? self.inventory)
    }
}
