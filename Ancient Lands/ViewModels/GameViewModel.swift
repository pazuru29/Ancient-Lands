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
                self.goToNextLocation()
            }
        case .examine:
            clouser = {
                let random = Bool.random()
                if random {
                    self.currentGame.supplement?.story = "You don't notice anything."
                } else {
                    self.currentGame.supplement?.story = "You notice the trap."
                    self.currentGame.supplement?.actions.append(.defuse)
                    self.currentGame.usedSupplementActions.append(.open)
                }
            }
        case .open:
            clouser = {
                //TODO: - add drop or battle
            }
        case .passBy:
            clouser = {
                //TODO: - battle or next location
                let random = Bool.random()
                if random {
                    
                } else {
                    self.goToNextLocation()
                }
            }
        case .useTheTrap:
            clouser = {
                //TODO: - add choose trap if player have 2 types, after add supplement "Trap"
            }
        case .attack:
            clouser = {
                //TODO: - add battle
            }
        case .escape:
            clouser = {
                //TODO: - change to 4
                let randomNumber = Int.random(in: 1..<3)
                switch(randomNumber) {
                case 1:
                    self.currentGame.supplement?.story = "You failed to escape, but the enemy didn't see you."
                case 2:
                    self.goToNextLocation()
                default:
                    //TODO: - add battle
                    {}()
                }
            }
        case .defuse:
            clouser = {
                //TODO: - add battle
                let random = Bool.random()
                if random {
                    
                } else {
                    self.goToNextLocation()
                }
            }
        case .wait:
            clouser = {
                //TODO: - add battle
                let random = Bool.random()
                if random {
                    
                } else {
                    
                }
            }
        case .knight:
            clouser = {
                //TODO: - add characteristic or hp - 65% / attack - 35%
                
            }
        case .elf:
            clouser = {
                //TODO: - dexterity - 50% / stealth - 50%
            }
        case .wizard:
            clouser = {
                //TODO: - defense - 60% / attack - 40%
            }
        case .fight:
            clouser = {
                //TODO: - Fight with boss
            }
        }
        
        return clouser
    }
    
    private func goToNextLocation() {
        let randomMeditation = Int.random(in: 1..<101)
        
        if randomMeditation > 1 {
            let randomLocations = GameStorage.gameLocations.filter { location in
                if location.type == self.currentGame.currentLocation.type {
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
}
