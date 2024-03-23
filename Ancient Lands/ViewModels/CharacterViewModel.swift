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
        
        if characterDB != nil {
            DispatchQueue.main.async {
                self.currentCharacter = Character.fromJSON(json: characterDB!.json ?? "")
            }
        }
    }
    
    func saveNewCharacter(character: Character) {
        if let characterDB = CoreDataManager.shared.getSavedCharacter() {
            CoreDataManager.shared.deleteAll()
        }
        
        currentCharacter = character
        
        let characterDB = CharacterDB(context: CoreDataManager.shared.viewContext)
        
        characterDB.json = character.toJSON()
        
        CoreDataManager.shared.save()
    }
}
