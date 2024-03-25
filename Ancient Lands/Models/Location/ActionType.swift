//
//  ActionType.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

enum ActionType: Codable {
    case lookAround
    case moveOn
    case examine
    case open
    case passBy
    case useTheTrap
    case attack
    case escape
}
