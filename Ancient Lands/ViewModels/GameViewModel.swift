//
//  GameViewModel.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

enum GameState {
    case loading
    case inGameLoading
    case loaded
}

class GameViewModel: ObservableObject {    
    weak var characterViewModel: CharacterViewModel?
    
    @Published var currentGame: Game = Game()
    
    @Published var gameState: GameState = .loaded
    
    //Toast with text
    @Published var isTextToastOpen: Bool = false
    
    @Published var toastText: String = ""
    
    //Toast of new drop
    @Published var isDropToastOpen: Bool = false
    
    @Published var dropTitle: String = ""
    
    @Published var dropToast: Dictionary<Int, Int> = [:]
    
    //Trap
    @Published var isPickTrapOpen: Bool = false
    
    //Battle
    @Published var isBattleItemsOpen = false
    
    @Published var typesOfBattleItems: [ItemType] = []
    
    @Published var typeOfActiveBattleButton: BattleCardType = .attack
    
    @Published var countOfEscapeFromBattle: Int = 0
    
    @Published var isGameLoose = false
    
    func embed(character: CharacterViewModel) {
        self.characterViewModel = character
    }
    
    func getInitData() {
        let gameDB = CoreDataManager.shared.getSavedGame()
        
        if let gameDB = gameDB {
            DispatchQueue.main.async {
                self.currentGame = Game.fromJSON(json: gameDB.json ?? "") ?? Game()
            }
            dPrint("TAKE LAST GAME")
        }
    }
    
    func getItitView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.isPickTrapOpen = self.currentGame.usedSupplementActions.contains(.useTheTrap) && self.currentGame.currentBattle == nil && self.currentGame.supplement?.assetName == GameStorage.somebody.assetName ? true : false
            
            self.isGameLoose = self.currentGame.isGameLoose
            
            dPrint("\(self.isPickTrapOpen)")
        }
    }
    
    func startNewGame() {
        self.gameState = .loading
        guard let characterViewModel, let currentCharacter = characterViewModel.currentCharacter else {
            return
        }
        
        let newCharacter = currentCharacter.copyWith(character: currentCharacter.typeOfCharacter.getCharacteristic(), inventory: currentCharacter.startInventory)
        
        characterViewModel.changeCharacter(character: newCharacter)
        
        let newGame = Game()
        
        saveNewGame(game: newGame)
        
        self.gameState = .loaded
    }
    
    func makeAction(action: ActionType) {
        self.gameState = .inGameLoading
        
        if currentGame.supplement != nil {
            currentGame.usedSupplementActions.append(action)
        } else {
            currentGame.usedActions.append(action)
        }
        
        actionFunction(action: action)()
        
        saveNewGame(game: currentGame)
        
        self.gameState = .loaded
    }
    
    func selectTrap(selectedTrap: any ItemCardModelProtocol) {
        self.gameState = .inGameLoading
        
        self.isPickTrapOpen = false
        
        if selectedTrap.id == 6 {
            self.currentGame.supplement = GameStorage.trap
        } else if selectedTrap.id == 7 {
            self.currentGame.supplement = GameStorage.potionTrap
        }
        
        guard var newCharacter = characterViewModel?.currentCharacter else {
            return
        }
        
        if newCharacter.inventory[selectedTrap.id] == 1 {
            newCharacter.inventory[selectedTrap.id] = nil
        } else {
            newCharacter.inventory[selectedTrap.id]! -= 1
        }
        
        characterViewModel?.changeCharacter(character: newCharacter)
        
        saveNewGame(game: currentGame)
        
        self.gameState = .loaded
    }
    
    func equipCard(card: any ItemCardModelProtocol) {
        guard var newCharacter = characterViewModel?.currentCharacter else {
            return
        }
        
        if card.type == .armor {
            newCharacter.equipment.armor = card as? ValueItemCardModel
        } else if card.type == .shield {
            newCharacter.equipment.shield = card as? ValueItemCardModel
        } else if card.type == .amplification {
            newCharacter.equipment.accessory = card as? ItemCardModel
        }
        
        characterViewModel?.changeCharacter(character: newCharacter)
    }
    
    func unequipCard(card: any ItemCardModelProtocol) {
        guard var newCharacter = characterViewModel?.currentCharacter else {
            return
        }
        
        if card.type == .armor {
            newCharacter.equipment.armor = nil
        } else if card.type == .shield {
            newCharacter.equipment.shield = nil
        } else if card.type == .amplification {
            newCharacter.equipment.accessory = nil
        }
        
        characterViewModel?.changeCharacter(character: newCharacter)
    }
    
    func openBattleItemsSheet(typeOfButton: BattleCardType) {
        typeOfActiveBattleButton = typeOfButton
        
        switch(typeOfButton) {
        case .attack:
            typesOfBattleItems = [.rangedWeapon, .ammo, .meleeWeapon, .grenade, .magicWeapon, .spell]
        case .defense:
            typesOfBattleItems = [.shield]
        case .potion:
            typesOfBattleItems = [.potion]
        }
        
        isBattleItemsOpen = true
    }
    
    func saveNewGame(game: Game) {
        if let gameDB = CoreDataManager.shared.getSavedGame() {
            CoreDataManager.shared.deleteGame(gameDB)
        }
        
        currentGame = game
        
        let gameDB = GameDB(context: CoreDataManager.shared.viewContext)
        
        gameDB.json = game.toJSON()
        
        CoreDataManager.shared.save()
    }
    
    func looseGame() {
        self.isGameLoose = false
        
        guard let character = characterViewModel?.currentCharacter else {
            return
        }
        
        let newCharacter = character.copyWith(character: character.typeOfCharacter.getCharacteristic(), inventory: character.startInventory)
        
        characterViewModel?.changeCharacter(character: newCharacter)
        
        if let gameDB = CoreDataManager.shared.getSavedGame() {
            CoreDataManager.shared.deleteGame(gameDB)
        }
        
        CoreDataManager.shared.save()
    }
    
    private func actionFunction(action: ActionType) -> () -> Void {
        let clouser: () -> Void
        
        switch(action) {
        case .lookAround:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                switch(randomNumber) {
                case 1...2:
                    self.currentGame.supplement = GameStorage.ancientChest
                case 3...20:
                    self.currentGame.supplement = GameStorage.chest
                case 21...35:
                    self.currentGame.supplement = GameStorage.nothing
                default:
                    guard let character = self.characterViewModel?.currentCharacter else {
                        return
                    }
                    
                    let hasTraps = character.inventory.keys.contains(6) || character.inventory.keys.contains(7)
                    
                    self.currentGame.supplement = GameStorage.somebody
                    
                    if !hasTraps {
                        guard var supplement = self.currentGame.supplement else {
                            return
                        }
                        
                        supplement.actions.removeFirst()
                    }
                }
            }
        case .moveOn:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                switch(randomNumber) {
                case 1...40:
                    self.toastText = "You decided to move on, but you were attacked."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .enemy)
                default:
                    self.goToNextLocation()
                }
            }
        case .examine:
            clouser = {
                let random = Bool.random()
                if random {
                    self.currentGame.supplement?.story = "You don't notice anything."
                } else {
                    self.currentGame.supplement?.story = "You notice the trap."
                    self.currentGame.usedSupplementActions.append(.open)
                    self.currentGame.supplement?.actions.append(.defuse)
                }
            }
        case .open:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                switch(randomNumber) {
                case 1...20:
                    self.addDrop(dropType: self.currentGame.supplement!.assetName == "Chest" ? .chest : .ancientChest)
                    self.goToNextLocation()
                default:
                    self.toastText = "You decide to open the chest, but it turns out to be a trap."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .enemy, chestType: self.currentGame.supplement!.assetName == "Chest" ? .chest : .ancientChest)
                }
            }
        case .passBy:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                let extraChance = (self.characterViewModel?.currentCharacter?.character.stealth ?? 2)
                
                let defaultChance = 25 + Int.random(in: 1...extraChance)
                
                switch(randomNumber) {
                case 1...defaultChance:
                    self.goToNextLocation()
                default:
                    self.addBattle(stepOfBattle: .enemy)
                }
            }
        case .useTheTrap:
            clouser = {
                self.isPickTrapOpen = true
            }
        case .attack:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                let extraChanceStealth = (self.characterViewModel?.currentCharacter?.character.stealth ?? 2)
                
                let extraChanceDexterity = (self.characterViewModel?.currentCharacter?.character.dexterity ?? 4) / 2
                
                let defaultChance = 10 + Int.random(in: 1...extraChanceStealth) + Int.random(in: 1...extraChanceDexterity)
                
                switch(randomNumber) {
                case 1...defaultChance:
                    self.toastText = "You swiftly attack the enemy, he didn't expect it."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .player)
                default:
                    self.toastText = "You try to attack the enemy, but he dodges and a fight breaks out between you."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .enemy)
                }
            }
        case .escape:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                let extraChanceStealthDivided2 = (self.characterViewModel?.currentCharacter?.character.stealth ?? 4) / 2
                
                let extraChanceStealth = (self.characterViewModel?.currentCharacter?.character.stealth ?? 2)
                
                let extraChanceDexterity = (self.characterViewModel?.currentCharacter?.character.dexterity ?? 2)
                
                let escapeChance = 10 + Int.random(in: 1...extraChanceStealthDivided2) + Int.random(in: 1...extraChanceDexterity)
                
                let stealthChance = escapeChance + Int.random(in: 1...extraChanceStealth)
                
                switch(randomNumber) {
                case 1...escapeChance:
                    self.goToNextLocation()
                case (escapeChance + 1)...stealthChance:
                    self.currentGame.supplement?.story = "You failed to escape, but the enemy didn't see you."
                default:
                    self.toastText = "You tried to sneak past the enemy, but he spotted you."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .enemy)
                }
            }
        case .defuse:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                let extraChanceDexterity = (self.characterViewModel?.currentCharacter?.character.dexterity ?? 2)
                
                let defuseChance = 30 + Int.random(in: 1...extraChanceDexterity)
                
                let chanceToEnemy = (100 - ((100 - defuseChance) / 2))
                
                switch(randomNumber) {
                case 1...defuseChance:
                    self.addDrop(dropType: self.currentGame.supplement!.assetName == "Chest" ? .chest : .ancientChest)
                    self.goToNextLocation()
                case (defuseChance + 1)...chanceToEnemy:
                    self.toastText = "You failed to open the chest."
                    self.isTextToastOpen = true
                    self.goToNextLocation()
                default:
                    self.toastText = "When disarming a trap, you get caught in it and are ambushed by an enemy."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .enemy, chestType: self.currentGame.supplement!.assetName == "Chest" ? .chest : .ancientChest)
                }
            }
        case .wait:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                let extraChanceStealth = (self.characterViewModel?.currentCharacter?.character.stealth ?? 2)
                
                let trapChance = 20 + Int.random(in: 1...extraChanceStealth)
                
                switch(randomNumber) {
                case 1...trapChance:
                    self.toastText = "You lurked close to the trap and as soon as the enemy hit it, you swiftly attacked him."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .player, needPoison: self.currentGame.supplement?.assetName == "PoisonTrap")
                default:
                    self.toastText = "You lurk near a trap, but your stealth is not as good as you think, the enemy notices you and the fight begins."
                    self.isTextToastOpen = true
                    self.addBattle(stepOfBattle: .enemy)
                }
            }
        case .improveAttack, .improveHp, .improveDefense:
            clouser = {
                let isImproved = Int.random(in: 1..<101)
                
                switch(isImproved) {
                case 1...65:
                    if var newCharacter = self.characterViewModel?.currentCharacter {
                        if action == .improveHp {
                            newCharacter.character.hp += 5
                            self.toastText = "You've increased your HP."
                        }
                        
                        if action == .improveAttack {
                            newCharacter.character.attack += 5
                            self.toastText = "You've raised your attack level."
                        }
                        
                        if action == .improveDefense {
                            newCharacter.character.defense += 5
                            self.toastText = "You've increased your level of defense."
                        }
                        
                        self.characterViewModel?.changeCharacter(character: newCharacter)
                    }
                default:
                    self.toastText = "You failed to master the skill."
                }
                
                self.isTextToastOpen = true
                
                self.goToNextLocation()
            }
        case .fight:
            clouser = {
                self.toastText = "You've been coming to this for a long time, you're ready to take the fight to one of the strongest beings in this world."
                self.isTextToastOpen = true
                self.addBattle(stepOfBattle: .player, isBossFight: true)
            }
        case .backOut:
            clouser = {
                self.goToNextLocation()
            }
        }
        
        return clouser
    }
    
    private func addDrop(dropType: DropType, needChest: Bool = false) {
        var drop: Dictionary<Int, Int> = [:]
        
        switch(dropType) {
        case .chest:
            self.dropTitle = "You opened the chest, there were things in there:"
            drop = CardStorage.dropFromChest.randomElement()!
        case .ancientChest:
            self.dropTitle = "You opened the chest, there were things in there:"
            drop = CardStorage.dropFromAncientChest.randomElement()!
        case .easyBattle:
            if needChest {
                self.dropTitle = "You defeated the enemy! He had some things. You also open a chest."
                drop = CardStorage.dropAfterWinEasy.randomElement()!
                
                drop = dropFromChest(chestType: currentGame.currentBattle!.chest!, drop: drop)
            } else {
                self.dropTitle = "You defeated the enemy! He had some things."
                drop = CardStorage.dropAfterWinEasy.randomElement()!
            }
        case .mediumBattle:
            if needChest {
                self.dropTitle = "You defeated the enemy! He had some things. You also open a chest."
                drop = CardStorage.dropAfterWinMedium.randomElement()!
                
                drop = dropFromChest(chestType: currentGame.currentBattle!.chest!, drop: drop)
            } else {
                self.dropTitle = "You defeated the enemy! He had some things."
                drop = CardStorage.dropAfterWinMedium.randomElement()!
            }
        case .bossBattle:
            if needChest {
                self.dropTitle = "You defeated the enemy! He had some things. You also open a chest."
                drop = CardStorage.dropAfterWinBoss.randomElement()!
                
                drop = dropFromChest(chestType: currentGame.currentBattle!.chest!, drop: drop)
            } else {
                self.dropTitle = "You have defeated one of your most dangerous enemies! Now all his belongings are yours!"
                drop = CardStorage.dropAfterWinBoss.randomElement()!
            }
        }
        
        if var newCharacter = characterViewModel?.currentCharacter {
            
            for (itemID, count) in drop {
                if newCharacter.inventory.contains(where: { (id, countCards) in
                    itemID == id
                }) {
                    newCharacter.inventory[itemID]! += count
                } else {
                    newCharacter.inventory[itemID] = count
                }
            }
            
            characterViewModel?.changeCharacter(character: newCharacter)
        }
        
        self.dropToast = drop
        self.isDropToastOpen = true
    }
    
    private func dropFromChest(chestType: ChestType, drop: Dictionary<Int, Int>? = nil) -> Dictionary<Int,Int> {
        var dropAfterGame: Dictionary<Int, Int>? = drop
        var chestDrop: Dictionary<Int, Int> = [:]
        if currentGame.currentBattle?.chest == .chest {
            chestDrop = CardStorage.dropFromChest.randomElement()!
        } else {
            chestDrop = CardStorage.dropFromChest.randomElement()!
        }
        
        if let drop = dropAfterGame {
            for (id, count) in chestDrop {
                if drop.keys.contains(id) {
                    dropAfterGame![id]! += count
                } else {
                    dropAfterGame![id] = count
                }
            }
        }
        
        return dropAfterGame ?? chestDrop
    }
    
    private func goToNextLocation() {
        let randomLocationBossMeditation = Int.random(in: 1...100)
        
        if randomLocationBossMeditation == 1 && self.currentGame.currentLocation.type != .any && self.currentGame.currentLocation.type != .boss {
            
            var meditation = GameStorage.meditation
            meditation.nextLocations.append(self.currentGame.currentLocation.type)
            self.currentGame.currentLocation = meditation
            
        } else if randomLocationBossMeditation <= 8 && currentGame.countOfLocations > 20 && currentGame.countOfDefeatedEnemy > 15 && self.currentGame.currentLocation.type != .any && self.currentGame.currentLocation.type != .boss {
            
            var bossLocation = GameStorage.bossLocations.randomElement()!
            bossLocation.nextLocations.append(self.currentGame.currentLocation.type)
            self.currentGame.currentLocation = bossLocation
            
        } else {
            let randomLocations = GameStorage.gameLocations.filter { location in
                if self.currentGame.currentLocation.type == .any || self.currentGame.currentLocation.type == .boss {
                    self.currentGame.currentLocation.nextLocations.contains(location.type)
                } else if location.type == self.currentGame.currentLocation.type {
                    self.currentGame.currentLocation.nextLocations.contains(location.type) && self.currentGame.currentLocation.assetName != location.assetName
                } else {
                    self.currentGame.currentLocation.nextLocations.contains(location.type) && location.nextLocations.contains(self.currentGame.currentLocation.type)
                }
            }
            
            var newLocation = randomLocations.randomElement()!
            
            if newLocation.type != .gorges && newLocation.type != self.currentGame.currentLocation.type {
                newLocation.nextLocations = [newLocation.type]
            }
            
            self.currentGame.currentLocation = newLocation
        }
        
        self.currentGame.supplement = nil
        self.currentGame.usedActions.removeAll()
        self.currentGame.usedSupplementActions.removeAll()
        
        self.currentGame.countOfLocations += 1
    }
    
    //MARK: Battle
    func endBattle(isWin: Bool = false) {
        if isWin {
            let random = Int.random(in: 1...100)
            
            if currentGame.currentBattle?.chest != nil {
                switch(random) {
                case 1...30:
                    if currentGame.currentBattle?.battleType == .easy {
                        addDrop(dropType: .easyBattle, needChest: currentGame.currentBattle?.chest != nil)
                    } else if currentGame.currentBattle?.battleType == .medium {
                        addDrop(dropType: .mediumBattle, needChest: currentGame.currentBattle?.chest != nil)
                    } else if currentGame.currentBattle?.battleType == .boss {
                        addDrop(dropType: .bossBattle, needChest: currentGame.currentBattle?.chest != nil)
                    }
                default:
                    addDrop(dropType: currentGame.currentBattle!.chest == .chest ? .chest : .ancientChest)
                }
            } else {
                switch(random) {
                case 1...30:
                    if currentGame.currentBattle?.battleType == .easy {
                        addDrop(dropType: .easyBattle)
                    } else if currentGame.currentBattle?.battleType == .medium {
                        addDrop(dropType: .mediumBattle)
                    } else if currentGame.currentBattle?.battleType == .boss {
                        addDrop(dropType: .bossBattle)
                    }
                default:
                    self.toastText = "You have defeated the enemy! But he didn't have anything to spare..."
                    self.isTextToastOpen = true
                }
            }
            
            if currentGame.currentBattle?.battleType == .boss {
                self.currentGame.countOfDefeatedBosses += 1
            } else {
                self.currentGame.countOfDefeatedEnemy += 1
            }
            
            self.countOfEscapeFromBattle = 0
            self.currentGame.currentBattle = nil
            self.goToNextLocation()
            
        } else {
            if currentGame.currentBattle!.battleType == .boss {
                self.currentGame.isGameLoose = true
                self.isGameLoose = true
            } else {
                self.toastText = "You lost this battle, but your adventure is not over, go out and get stronger."
                self.isTextToastOpen = true
                
                self.countOfEscapeFromBattle = 0
                self.currentGame.currentBattle = nil
                self.goToNextLocation()
            }
        }
        
        saveNewGame(game: self.currentGame)
    }
    
    func escapeFromBattle() {
        let randomNumber = Int.random(in: 1..<101)
        
        let extraChanceStealthDivided2 = (characterViewModel?.currentCharacter?.character.stealth ?? 4) / 2
        
        let extraChanceDexterity = (characterViewModel?.currentCharacter?.character.dexterity ?? 2)
        
        let escapeChance = 10 + Int.random(in: 1...extraChanceStealthDivided2) + Int.random(in: 1...extraChanceDexterity)
        
        switch(randomNumber) {
        case 1...escapeChance:
            self.toastText = "You escaped the battle before the enemy could seriously injure you."
            self.isTextToastOpen = true
            self.endBattle()
        default:
            self.toastText = "You tried to escape, but the enemy doesn't think to let you go."
            self.isTextToastOpen = true
            self.countOfEscapeFromBattle += 1
        }
    }
    
    func attackEnemy() {
        if let battle = currentGame.currentBattle {
            var attackPower = 0
            
            if (characterViewModel?.currentCharacter?.typeOfCharacter == .knight || characterViewModel?.currentCharacter?.typeOfCharacter == .knightWm) && (currentGame.currentLocation.type == .caves || currentGame.currentLocation.type == .dungeons) {
                let randomBuff = Int.random(in: 1...20)
                
                attackPower += randomBuff
            } else if (characterViewModel?.currentCharacter?.typeOfCharacter == .elf || characterViewModel?.currentCharacter?.typeOfCharacter == .elfWm) && currentGame.currentLocation.type == .forest {
                let randomBuff = Int.random(in: 1...20)
                
                attackPower += randomBuff
            } else if (characterViewModel?.currentCharacter?.typeOfCharacter == .wizard || characterViewModel?.currentCharacter?.typeOfCharacter == .wizardWm) && currentGame.currentLocation.type == .caves {
                let randomBuff = Int.random(in: 1...20)
                
                attackPower += randomBuff
            }
            
            for attack in battle.currentPlayCards {
                let random = Int.random(in: 1...attack.value)
                
                attackPower += random
                
                if attack.type == .ammo || attack.type == .spell || attack.type == .grenade {
                    if var character = characterViewModel?.currentCharacter {
                        if (character.typeOfCharacter == .elf || character.typeOfCharacter == .elfWm) && attack.type == .ammo {
                            let random = Int.random(in: 1...100)
                            
                            if random > 10 {
                                if character.inventory[attack.id] == 1 {
                                    character.inventory[attack.id] = nil
                                } else {
                                    character.inventory[attack.id]! -= 1
                                }
                            }
                        } else {
                            if character.inventory[attack.id] == 1 {
                                character.inventory[attack.id] = nil
                            } else {
                                character.inventory[attack.id]! -= 1
                            }
                        }
                        
                        characterViewModel?.changeCharacter(character: character)
                    }
                }
            }
            
            for effect in battle.playerEffects {
                if effect.typeOfCharacteristic == .attack {
                    let random = Int.random(in: 1...effect.value)
                    
                    attackPower += random
                    
                    if effect.countOfRounds == 1 {
                        currentGame.currentBattle?.playerEffects.removeAll(where: { $0.id == effect.id })
                    } else {
                        let index = currentGame.currentBattle!.playerEffects.firstIndex(where: { $0.id == effect.id })
                        
                        if let index = index {
                            currentGame.currentBattle!.playerEffects[index].countOfRounds -= 1
                        }
                    }
                }
            }
            
            for debuff in battle.enemy.debuffs {
                if debuff.typeOfCharacteristic == .hp {
                    let random = Int.random(in: 1...debuff.value)
                    
                    attackPower += random
                    
                    if debuff.countOfRounds == 1 {
                        currentGame.currentBattle?.enemy.debuffs.removeAll(where: { $0.id == debuff.id })
                    } else {
                        let index = currentGame.currentBattle!.enemy.debuffs.firstIndex(where: { $0.id == debuff.id })
                        
                        if let index = index {
                            currentGame.currentBattle!.enemy.debuffs[index].countOfRounds -= 1
                        }
                    }
                }
            }
            
            attackPower += Int.random(in: 1...(characterViewModel?.currentCharacter?.character.attack ?? 2))
            if characterViewModel?.currentCharacter?.typeOfCharacter == .knight || characterViewModel?.currentCharacter?.typeOfCharacter == .knightWm {
                if battle.currentPlayCards.contains(where: { $0.type == .meleeWeapon}) {
                    attackPower += Int.random(in: 1...10)
                    
                    let random = Int.random(in: 1...100)
                    
                    if random <= 30 {
                        attackPower += (attackPower / 3)
                    }
                }
            } else if characterViewModel?.currentCharacter?.typeOfCharacter == .elf || characterViewModel?.currentCharacter?.typeOfCharacter == .elfWm {
                if battle.currentPlayCards.contains(where: { $0.type == .rangedWeapon}) {
                    attackPower += Int.random(in: 1...10)
                }
            }
            
            if currentGame.currentBattle!.currentEnemyHp - attackPower <= 0 {
                currentGame.currentBattle!.currentEnemyHp = 0
                endBattle(isWin: true)
            } else {
                currentGame.currentBattle!.currentEnemyHp -= attackPower
                currentGame.currentBattle!.step = .enemy
            }
            
            if let shield = characterViewModel?.currentCharacter?.equipment.shield {
                currentGame.currentBattle?.currentPlayCards = [shield]
            } else {
                currentGame.currentBattle?.currentPlayCards = []
            }
            
            saveNewGame(game: currentGame)
        }
    }
    
    func defenseFromEnemy() {
        if let battle = currentGame.currentBattle {
            var currentAttackEnemy = battle.enemy.attacks.randomElement()!
            
            if (characterViewModel?.currentCharacter?.typeOfCharacter == .knight || characterViewModel?.currentCharacter?.typeOfCharacter == .knightWm) && (currentGame.currentLocation.type == .caves || currentGame.currentLocation.type == .dungeons) {
                let randomBuff = Int.random(in: 1...20)
                
                currentAttackEnemy -= randomBuff
            }
            
            if (characterViewModel?.currentCharacter?.typeOfCharacter == .elf || characterViewModel?.currentCharacter?.typeOfCharacter == .elfWm) && currentGame.currentLocation.type == .forest {
                let randomBuff = Int.random(in: 1...10)
                
                currentAttackEnemy -= randomBuff
            }
            
            if (characterViewModel?.currentCharacter?.typeOfCharacter == .wizard || characterViewModel?.currentCharacter?.typeOfCharacter == .wizardWm) && currentGame.currentLocation.type == .caves {
                let randomBuff = Int.random(in: 1...10)
                
                currentAttackEnemy -= randomBuff
            }
            
            for defense in battle.currentPlayCards {
                let random = Int.random(in: 1...defense.value)
                
                currentAttackEnemy -= random
                
                if currentAttackEnemy < 0 {
                    currentAttackEnemy = 0
                    
                    let crashedChance = Int.random(in: 1...100)
                    
                    if var character = characterViewModel?.currentCharacter {
                        if crashedChance <= 2 {
                            if character.inventory[defense.id] == 1 {
                                character.inventory[defense.id] = nil
                                character.equipment.shield = nil
                            } else {
                                character.inventory[defense.id]! -= 1
                            }
                            
                            characterViewModel?.changeCharacter(character: character)
                        }
                    }
                }
            }
            
            if let armor = characterViewModel?.currentCharacter?.equipment.armor {
                let random = Int.random(in: 1...armor.value)
                
                currentAttackEnemy -= random
                
                if currentAttackEnemy < 0 {
                    currentAttackEnemy = 0
                }
            }
            
            for effect in battle.playerEffects {
                if effect.typeOfCharacteristic == .defense {
                    let random = Int.random(in: 1...effect.value)
                    
                    currentAttackEnemy -= random
                    
                    if effect.countOfRounds == 1 {
                        currentGame.currentBattle?.playerEffects.removeAll(where: { $0.id == effect.id })
                    } else {
                        let index = currentGame.currentBattle!.playerEffects.firstIndex(where: { $0.id == effect.id })
                        
                        if let index = index {
                            currentGame.currentBattle!.playerEffects[index].countOfRounds -= 1
                        }
                    }
                    
                    if currentAttackEnemy < 0 {
                        currentAttackEnemy = 0
                    }
                }
            }
            
            if currentGame.currentBattle!.currentPlayerHp - currentAttackEnemy <= 0 {
                currentGame.currentBattle!.currentPlayerHp = 0
                
                endBattle()
            } else {
                currentGame.currentBattle!.currentPlayerHp -= currentAttackEnemy
                currentGame.currentBattle!.step = .player
            }
            
            currentGame.currentBattle?.currentPlayCards = []
            
            saveNewGame(game: currentGame)
        }
    }
    
    func addBattle(stepOfBattle: TypeStep, isBossFight: Bool = false, needPoison: Bool = false, chestType: ChestType? = nil) {
        var enemy: Enemy
        
        var typeOfEnemy: TypeOfEnemy
        
        var currentPlayCards: [ValueItemCardModel] = []
        
        if isBossFight {
            enemy = GameStorage.bossEnemys.randomElement()!
            typeOfEnemy = .boss
        } else {
            if currentGame.countOfLocations < 10 || currentGame.countOfDefeatedEnemy < 5 {
                enemy = GameStorage.easyEnemys.filter({ $0.typeOfLocation == currentGame.currentLocation.type }).randomElement()!
                typeOfEnemy = .easy
            } else if currentGame.countOfLocations < 20 || currentGame.countOfDefeatedEnemy < 15 {
                let randomEnemy = Int.random(in: 1...3)
                
                switch(randomEnemy) {
                case 1...2:
                    enemy = GameStorage.easyEnemys.filter({ $0.typeOfLocation == currentGame.currentLocation.type }).randomElement()!
                    typeOfEnemy = .easy
                default:
                    enemy = GameStorage.mediumEnemys.filter({ $0.typeOfLocation == currentGame.currentLocation.type }).randomElement()!
                    typeOfEnemy = .medium
                }
            } else {
                let randomEnemy = Int.random(in: 1...3)
                
                switch(randomEnemy) {
                case 1...2:
                    enemy = GameStorage.mediumEnemys.filter({ $0.typeOfLocation == currentGame.currentLocation.type }).randomElement()!
                    typeOfEnemy = .medium
                default:
                    enemy = GameStorage.easyEnemys.filter({ $0.typeOfLocation == currentGame.currentLocation.type }).randomElement()!
                    typeOfEnemy = .easy
                }
            }
        }
        
        if needPoison {
            enemy.debuffs.append(CardStorage.poisonEffect)
        }
        
        if let character = characterViewModel?.currentCharacter {
            if stepOfBattle == .enemy && character.equipment.shield != nil {
                currentPlayCards.append(character.equipment.shield!)
            }
            
            self.currentGame.currentBattle = Battle(battleType: typeOfEnemy, step: stepOfBattle, enemy: enemy, currentEnemyHp: enemy.hp, currentPlayerHp: character.character.hp, playerEffects: [], currentPlayCards: currentPlayCards, chest: chestType)
        }
    }
}
