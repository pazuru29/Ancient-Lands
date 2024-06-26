//
//  TypeStartCards.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 20.03.2024.
//

import Foundation

enum TypeStartCards: String, CaseIterable {
    case knight = "Knight's Set"
    case elf = "Elf's Set"
    case wizard = "Wizard's Set"
    
    func getCards() -> Dictionary<Int, Int> {
        switch(self) {
        case .elf:
            return CardStorage.elfSet
        case .knight:
            return CardStorage.knightSet
        case .wizard:
            return CardStorage.wizardSet
        }
    }
}
