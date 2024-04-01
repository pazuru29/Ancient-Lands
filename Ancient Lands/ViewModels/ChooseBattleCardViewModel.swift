//
//  ChooseBattleCardViewModel.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 01.04.2024.
//

import Foundation

class ChooseBattleCardViewModel: ObservableObject {
    @Published var isWarningOpen: Bool = false
    
    @Published var warningText: String = "Fail"
    
    @Published var arrayOfCards: Array<(ItemType, Array<(Int, any ItemCardModelProtocol)>)> = []
    
    @Published var isDetailCardShowed: Bool = false
    @Published var currentDetailCard: (any ItemCardModelProtocol)? = nil
    
    @Published var selectedCards: Array<any ItemCardModelProtocol> = []
    
    func getInitData() {
        dPrint("TAKE INIT LIST OF CARDS")
        
        var cards: Array<(Int, any ItemCardModelProtocol)> = []
        
        let arrayOfId = Array(CharacterViewModel.shared.currentCharacter!.inventory)
        
        for item in arrayOfId {
            let card = CardStorage.allCards.first { card in
                card.id == item.key
            }
            
            cards.append((item.value, card!))
        }
        
        for type in GameViewModel.shared.typesOfBattleItems {
            let filtredCards = cards.filter({ (count, card) in
                card.type == type
            })
            
            if !filtredCards.isEmpty {
                arrayOfCards.append((type, filtredCards))
            }
        }
        
        selectedCards = GameViewModel.shared.currentGame.currentBattle?.currentPlayCards ?? []
    }
    
    func onCardTap(card: any ItemCardModelProtocol) {
        switch(GameViewModel.shared.typeOfActiveBattleButton) {
        case .attack:
            onAttackCardTap(card: card)
        case .defense:
            onDefenseCardTap(card: card)
        case .potion:
            onPotionCardTap(card: card)
        }
    }
    
    func selectButtonActive() -> Bool {
        switch(GameViewModel.shared.typeOfActiveBattleButton) {
        case .attack:
            return attackButtonActive()
        case .defense:
            return defenseButtonActive()
        case .potion:
            return potionButtonActive()
        }
    }
    
    func onSelectButtonPressed() {
        switch(GameViewModel.shared.typeOfActiveBattleButton) {
        case .attack, .defense:
            GameViewModel.shared.currentGame.currentBattle?.currentPlayCards = selectedCards as! Array<ItemCardModel>
        case .potion:
            var effects: [GameEffects] = []
            
            for card in selectedCards {
                if let card = card as? PotionItemCardModel {
                    if card.id == 2 {
                        let newHp = (GameViewModel.shared.currentGame.currentBattle?.currentPlayerHp ?? 100) + card.effect.value
                        
                        if newHp > (CharacterViewModel.shared.currentCharacter?.character.hp ?? 100) {
                            GameViewModel.shared.currentGame.currentBattle?.currentPlayerHp = CharacterViewModel.shared.currentCharacter?.character.hp ?? 100
                        } else {
                            GameViewModel.shared.currentGame.currentBattle?.currentPlayerHp = newHp
                        }
                    } else {
                        effects.append(card.effect)
                    }
                    
                    let countOfCards = CharacterViewModel.shared.currentCharacter?.inventory[card.id]
                    
                    if let countOfCards = countOfCards {
                        if countOfCards > 1 {
                            CharacterViewModel.shared.currentCharacter!.inventory[card.id]! -= 1
                        } else {
                            CharacterViewModel.shared.currentCharacter!.inventory[card.id] = nil
                        }
                        
                        CharacterViewModel.shared.changeCharacter(character: CharacterViewModel.shared.currentCharacter!)
                    }
                }
            }
            
            GameViewModel.shared.currentGame.currentBattle?.playerEffects = effects
        }
        
        GameViewModel.shared.saveNewGame(game: GameViewModel.shared.currentGame)
    }
    
    private func onAttackCardTap(card: any ItemCardModelProtocol) {
        let hasAnotherTypeOfWeapon = ((card.type == .rangedWeapon || card.type == .ammo) && selectedCards.contains(where: { itemCard in
            itemCard.type == .meleeWeapon || itemCard.type == .magicWeapon || itemCard.type == .spell
        })) || (card.type == .meleeWeapon && selectedCards.contains(where: { itemCard in
            itemCard.type == .rangedWeapon || itemCard.type == .magicWeapon || itemCard.type == .spell || itemCard.type == .ammo
        })) || ((card.type == .magicWeapon || card.type == .spell) && selectedCards.contains(where: { itemCard in
            itemCard.type == .meleeWeapon || itemCard.type == .rangedWeapon || itemCard.type == .ammo
        }))
        
        if hasAnotherTypeOfWeapon {
            warningText = "Only one type of weapon can be used for one attack."
            isWarningOpen = true
        } else {
            if selectedCards.contains(where: { $0.id == card.id }) {
                selectedCards.removeAll { itemCard in
                    itemCard.id == card.id
                }
            } else if selectedCards.contains(where: { itemCard in
                itemCard.type == card.type
            }) {
                selectedCards.removeAll { itemCard in
                    itemCard.type == card.type
                }
                selectedCards.append(card)
            } else {
                selectedCards.append(card)
            }
        }
    }
    
    private func onDefenseCardTap(card: any ItemCardModelProtocol) {
        if selectedCards.count == 1 {
            warningText = "Only one defense card can be used."
            isWarningOpen = true
        } else {
            if selectedCards.contains(where: { $0.id == card.id }) {
                selectedCards.removeAll { itemCard in
                    itemCard.id == card.id
                }
            } else {
                selectedCards.append(card)
            }
        }
    }
    
    private func onPotionCardTap(card: any ItemCardModelProtocol) {
        if let card = card as? PotionItemCardModel, let currentBattle = GameViewModel.shared.currentGame.currentBattle {
            if currentBattle.playerEffects.contains(where: {$0.id == card.effect.id}) {
                warningText = "This effect is already in use."
                isWarningOpen = true
            } else {
                if selectedCards.contains(where: { $0.id == card.id }) {
                    selectedCards.removeAll { itemCard in
                        itemCard.id == card.id
                    }
                } else {
                    selectedCards.append(card)
                }
            }
        }
    }
    
    private func attackButtonActive() -> Bool {
        let hasRangeWeapon = selectedCards.contains { itemCard in
            itemCard.type == .rangedWeapon
        }
        
        let hasAmmo = selectedCards.contains { itemCard in
            itemCard.type == .ammo
        }
        
        let hasMagicWeapon = selectedCards.contains { itemCard in
            itemCard.type == .magicWeapon
        }
        
        let hasSpells = selectedCards.contains { itemCard in
            itemCard.type == .spell
        }
        
        var rangeWeaponActive = false
        
        var magicWeaponActive = false
        
        if hasRangeWeapon || hasAmmo {
            rangeWeaponActive = hasRangeWeapon && hasAmmo
        }
        
        if hasMagicWeapon || hasSpells {
            magicWeaponActive = hasMagicWeapon && hasSpells
        }
        
        if (hasRangeWeapon || hasAmmo) && (hasMagicWeapon || hasSpells) {
            return rangeWeaponActive && magicWeaponActive
        }
        
        if hasRangeWeapon || hasAmmo {
            return rangeWeaponActive
        }
        
        if hasMagicWeapon || hasSpells {
            return magicWeaponActive
        }
        
        return true
    }
    
    private func defenseButtonActive() -> Bool {
        selectedCards.count <= 1
    }
    
    private func potionButtonActive() -> Bool {
        true
    }
}
