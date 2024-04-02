//
//  Character.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

struct Character: Codable {
    var character: TypeOfCharacterStruct
    var typeOfCharacter: TypeOfCharacter
    let name: String
    var equipment: Equipment
    var inventory: Dictionary<Int, Int> // ID - Count
    var startInventory: Dictionary<Int, Int> // ID - Count
    
    func copyWith(character: TypeOfCharacterStruct? = nil, name: String? = nil, equipment: Equipment? = nil, inventory: Dictionary<Int, Int>? = nil) -> Character {
        return Character(character: character ?? self.character, typeOfCharacter: self.typeOfCharacter, name: name ?? self.name, equipment: equipment ?? self.equipment, inventory: inventory ?? self.inventory, startInventory: self.startInventory)
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
    
    static func fromJSON(json: String) -> Character? {
        do {
            let jsonDecoder = JSONDecoder()
            
            let jsonData = json.data(using: .utf8) ?? Data()
            
            let decodeCharacter = try jsonDecoder.decode(Character.self, from: jsonData)
            
            return decodeCharacter
        } catch {
            return nil
        }
    }
}
