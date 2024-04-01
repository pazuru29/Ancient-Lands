//
//  Game.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

struct Game: Codable {
    var currentLocation: Location = GameStorage.startLocations.randomElement()!
    
    var supplement: Supplement? = nil
    
    var currentBattle: Battle? = nil
    
    var countOfLocations: Int = 0
    
    var countOfDefeatedEnemy: Int = 0
    
    var countOfDefeatedBosses: Int = 0
    
    var usedActions: [ActionType] = []
    
    var usedSupplementActions: [ActionType] = []
    
    var isGameLoose: Bool = false
    
    func copyWith(currentLocation: Location? = nil, supplement: Supplement? = nil, currentBattle: Battle? = nil, countOfLocations: Int? = nil, countOfDefeatedEnemy: Int? = nil, countOfDefeatedBosses: Int? = nil, usedActions: [ActionType]? = nil) -> Game {
        return Game(currentLocation: currentLocation ?? self.currentLocation, supplement: supplement ?? self.supplement, currentBattle: currentBattle ?? self.currentBattle, countOfLocations: countOfLocations ?? self.countOfLocations, countOfDefeatedEnemy: countOfDefeatedEnemy ?? self.countOfDefeatedEnemy, countOfDefeatedBosses: countOfDefeatedBosses ?? self.countOfDefeatedBosses, usedActions: usedActions ?? self.usedActions)
    }
    
    func toJSON() -> String {
        do {
            let jsonEncoder = JSONEncoder()
            
            let jsonData = try jsonEncoder.encode(self)
            
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            
            return json ?? ""
        } catch {
            return ""
        }
    }
    
    static func fromJSON(json: String) -> Game? {
        do {
            let jsonDecoder = JSONDecoder()
            
            let jsonData = json.data(using: .utf8) ?? Data()
            
            let decodeGame = try jsonDecoder.decode(Game.self, from: jsonData)
            
            return decodeGame
        } catch {
            return nil
        }
    }
}
