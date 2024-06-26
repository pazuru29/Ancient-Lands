//
//  CharacterViewModel.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 21.03.2024.
//

import Foundation


class CharacterViewModel: ObservableObject {
    @Published var currentCharacter: Character?
    
    @Published var selectedCharacter: TypeOfCharacter = .knight
    
    @Published var selectedCards: TypeStartCards = .knight
    
    func getInitData() {
        let characterDB = CoreDataManager.shared.getSavedCharacter()
        
        if let characterDB = characterDB {
            DispatchQueue.main.async {
                self.currentCharacter = Character.fromJSON(json: characterDB.json ?? "")
            }
        }
    }
    
    func createNewCharacter(character: Character) {
        if CoreDataManager.shared.getSavedCharacter() != nil {
            CoreDataManager.shared.deleteAll()
        }
        
        currentCharacter = character
        
        let characterDB = CharacterDB(context: CoreDataManager.shared.viewContext)
        
        characterDB.json = character.toJSON()
        
        CoreDataManager.shared.save()
    }
    
    func changeCharacter(character: Character) {
        if let character = CoreDataManager.shared.getSavedCharacter() {
            CoreDataManager.shared.deleteCharacter(character)
        }
        
        currentCharacter = character
        
        let characterDB = CharacterDB(context: CoreDataManager.shared.viewContext)
        
        characterDB.json = character.toJSON()
        
        CoreDataManager.shared.save()
    }
}
