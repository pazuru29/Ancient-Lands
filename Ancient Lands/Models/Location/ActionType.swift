//
//  ActionType.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

enum ActionType: String, Codable {
    case lookAround = "Look Around"
    case moveOn = "Move On"
    case examine = "Examine"
    case open = "Open"
    case passBy = "Pass By"
    case useTheTrap = "Use The Trap"
    case attack = "Attack"
    case escape = "Escape"
    case defuse = "Defuse"
    case wait = "Wait"
    case improveHp = "Improve Health"
    case improveAttack = "Improve Attack"
    case improveDefense = "Improve Defense"
    case fight = "Take the fight"
    case backOut = "Back out"
}
