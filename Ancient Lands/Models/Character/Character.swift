//
//  Character.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 19.03.2024.
//

import Foundation

struct Character: Codable {
    let type: TypeOfCharacter
    let name: String
    let equipment: Equipment
    let inventory: Dictionary<Int, Int> // ID - Count
    
    func copyWith(type: TypeOfCharacter? = nil, name: String? = nil, equipment: Equipment? = nil, inventory: Dictionary<Int, Int>? = nil) -> Character {
        return Character(type: type ?? self.type, name: name ?? self.name, equipment: equipment ?? self.equipment, inventory: inventory ?? self.inventory)
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
