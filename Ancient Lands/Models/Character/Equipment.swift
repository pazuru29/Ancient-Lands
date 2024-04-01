//
//  Equipment.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

struct Equipment: Codable {
    var armor: ValueItemCardModel?
    var accessory: ItemCardModel?
    var shield: ValueItemCardModel?
}
