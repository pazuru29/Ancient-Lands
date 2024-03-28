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
    static let shared = GameViewModel()
    
    @Published var currentGame: Game = Game()
    
    @Published var gameState: GameState = .loaded
    
    //Toast with text
    @Published var isTextToastOpen: Bool = false
    
    @Published var toastText: String = ""
    
    //Toast of new drop
    @Published var isDropToastOpen: Bool = false
    
    @Published var dropToast: Dictionary<Int, Int> = [:]
    
    func getInitData() {
        let gameDB = CoreDataManager.shared.getSavedGame()
        
        if let gameDB = gameDB {
            DispatchQueue.main.async {
                self.currentGame = Game.fromJSON(json: gameDB.json ?? "") ?? Game()
            }
            dPrint("TAKE LAST GAME")
        }
    }
    
    func startNewGame() {
        self.gameState = .loading
        
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
    
    private func saveNewGame(game: Game) {
        if let gameDB = CoreDataManager.shared.getSavedGame() {
            CoreDataManager.shared.deleteGame(gameDB)
        }
        
        currentGame = game
        
        let gameDB = GameDB(context: CoreDataManager.shared.viewContext)
        
        gameDB.json = game.toJSON()
        
        CoreDataManager.shared.save()
    }
    
    private func actionFunction(action: ActionType) -> () -> Void {
        let clouser: () -> Void
        
        switch(action) {
        case .lookAround:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                switch(randomNumber) {
                case 1...5:
                    self.currentGame.supplement = GameStorage.ancientChest
                case 6...15:
                    self.currentGame.supplement = GameStorage.chest
                case 16...35:
                    self.currentGame.supplement = GameStorage.nothing
                default:
                    self.currentGame.supplement = GameStorage.somebody
                }
            }
        case .moveOn:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                switch(randomNumber) {
                case 1...40:
                    //TODO: - add battle
                    self.testAddBattle()
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
                    self.addDrop(keyWord: self.currentGame.supplement!.assetName!)
                    self.goToNextLocation()
                default:
                    //TODO: - add battle
                    self.testAddBattle()
                }
            }
        case .passBy:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                let defaultChanse = 15 + (CharacterViewModel.shared.currentCharacter?.character.stealth ?? 0)
                
                switch(randomNumber) {
                case 1...defaultChanse:
                    self.goToNextLocation()
                default:
                    //TODO: - add battle
                    self.testAddBattle()
                }
            }
        case .useTheTrap:
            clouser = {
                //TODO: - add choose trap if player have 2 types, after add supplement "Trap"
                // Открытие шита с выбором ловушки
            }
        case .attack:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                let defaultChanse = 10 + (CharacterViewModel.shared.currentCharacter?.character.stealth ?? 0) + ((CharacterViewModel.shared.currentCharacter?.character.dexterity ?? 0) / 2)
                
                switch(randomNumber) {
                case 1...defaultChanse:
                    //TODO: - add battle player
                    self.testAddBattle()
                default:
                    //TODO: - add battle enemy
                    self.testAddBattle()
                }
            }
        case .escape:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                let escapeChanse = 10 + ((CharacterViewModel.shared.currentCharacter?.character.stealth ?? 0) / 2) + (CharacterViewModel.shared.currentCharacter?.character.dexterity ?? 0)
                
                let stealthChanse = escapeChanse + (CharacterViewModel.shared.currentCharacter?.character.stealth ?? 0)
                
                switch(randomNumber) {
                case 1...escapeChanse:
                    self.goToNextLocation()
                case (escapeChanse + 1)...stealthChanse:
                    self.currentGame.supplement?.story = "You failed to escape, but the enemy didn't see you."
                default:
                    //TODO: - add battle enemy
                    self.testAddBattle()
                }
            }
        case .defuse:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                //TODO: - add random chans from 0 to dexterity and evreything
                let defuseChanse = 20 + (CharacterViewModel.shared.currentCharacter?.character.dexterity ?? 0)
                
                let chanseToEnemy = (100 - ((100 - defuseChanse) / 2))
                
                switch(randomNumber) {
                case 1...defuseChanse:
                    self.addDrop(keyWord: self.currentGame.supplement!.assetName!)
                    self.goToNextLocation()
                case (defuseChanse + 1)...chanseToEnemy:
                    self.toastText = "You failed to open the chest."
                    self.isTextToastOpen = true
                    self.goToNextLocation()
                default:
                    //TODO: - add battle enemy
                    self.testAddBattle()
                }
            }
        case .wait:
            clouser = {
                let randomNumber = Int.random(in: 1..<101)
                
                let trapChanse = 20 + (CharacterViewModel.shared.currentCharacter?.character.stealth ?? 0)
                
                switch(randomNumber) {
                case 1...trapChanse:
                    //TODO: - battle player
                    self.testAddBattle()
                default:
                    //TODO: - add battle enemy
                    self.testAddBattle()
                }
            }
        case .improveAttack, .improveHp, .improveDefense:
            clouser = {
                let isImproved = Int.random(in: 1..<101)
                
                switch(isImproved) {
                case 1...65:
                    var newCharacter = CharacterViewModel.shared.currentCharacter!
                    
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
                    
                    CharacterViewModel.shared.changeCharacter(character: newCharacter)
                default:
                    self.toastText = "You failed to master the skill."
                }
                
                self.isTextToastOpen = true
                
                self.goToNextLocation()
            }
        case .fight:
            clouser = {
                //TODO: - Fight with boss
                self.testAddBattle()
            }
        }
        
        return clouser
    }
    
    private func addDrop(keyWord: String) {
        var drop: Dictionary<Int, Int> = [:]
        
        if keyWord == "AncientChest" {
            drop = CardStorage.dropFromAncientChest.randomElement()!
        } else if keyWord == "Chest" {
            drop = CardStorage.dropFromChest.randomElement()!
        }
        
        var newCharacter = CharacterViewModel.shared.currentCharacter!
        
        for (itemID, count) in drop {
            if newCharacter.inventory.contains(where: { (id, countCards) in
                itemID == id
            }) {
                newCharacter.inventory[itemID]! += count
            } else {
                newCharacter.inventory[itemID] = count
            }
        }
        
        CharacterViewModel.shared.changeCharacter(character: newCharacter)
        
        self.dropToast = drop
        self.isDropToastOpen = true
    }
    
    private func goToNextLocation() {
        let randomMeditation = Int.random(in: 1..<1001)
        
        if randomMeditation > 10 || self.currentGame.currentLocation.type == .any {
            let randomLocations = GameStorage.gameLocations.filter { location in
                if self.currentGame.currentLocation.type == .any {
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
        } else {
            var meditation = GameStorage.meditation
            meditation.nextLocations.append(self.currentGame.currentLocation.type)
            self.currentGame.currentLocation = meditation
        }
        
        self.currentGame.supplement = nil
        self.currentGame.usedActions.removeAll()
        self.currentGame.usedSupplementActions.removeAll()
        
        self.currentGame.countOfLocations += 1
    }
    
    //TODO: - remove
    func testEndBattle() {
        self.currentGame.currentBattle = nil
        self.currentGame.countOfDefeatedEnemy += 1
        self.goToNextLocation()
    }
    
    func testAddBattle() {
        self.currentGame.currentBattle = Battle(step: .player, enemy: GameStorage.easyEnemys.first!, currentEnemyHp: GameStorage.easyEnemys.first!.hp, playerHp: CharacterViewModel.shared.currentCharacter!.character.hp, effects: [], currentPlayCards: [])
    }
}
