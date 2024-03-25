//
//  GameViewModel.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var currentGame: Game? = nil
    
    func getInitData() {
        let gameDB = CoreDataManager.shared.getSavedGame()
        
        if let gameDB = gameDB {
            DispatchQueue.main.async {
                self.currentGame = Game.fromJSON(json: gameDB.json ?? "")
            }
            dPrint("TAKE LAST GAME")
        }
    }
    
    func startNewGame() {
        let newGame = Game()
        
        saveNewGame(game: newGame)
    }
    
    private func saveNewGame(game: Game) {
        if let gameDB = CoreDataManager.shared.getSavedGame() {
            CoreDataManager.shared.deleteGame(gameDB)
            dPrint("DELETE LAST GAME")
        }
        
        currentGame = game
        
        let gameDB = GameDB(context: CoreDataManager.shared.viewContext)
        
        gameDB.json = game.toJSON()
        
        CoreDataManager.shared.save()
    }
}
