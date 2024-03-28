//
//  CoreDataManager.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 21.03.2024.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    
    static let shared = CoreDataManager()
    
    let container = NSPersistentContainer(name: "AncientLandsCoreData")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                dPrint("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        do {
            try viewContext.save()
            dPrint("Data saved")
        } catch {
            viewContext.rollback()
            dPrint("Failed to save the data \(error.localizedDescription)")
        }
    }
    
    func deleteAll() {
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = CharacterDB.fetchRequest()
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        _ = try? container.viewContext.execute(batchDeleteRequest1)
        
        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = GameDB.fetchRequest()
        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        _ = try? container.viewContext.execute(batchDeleteRequest2)
        
        dPrint("All Data Removed")
    }
    
    func getSavedCharacter() -> CharacterDB? {
        let request: NSFetchRequest<CharacterDB> = CharacterDB.fetchRequest()
        
        do {
            return try viewContext.fetch(request).first
        } catch {
            dPrint("Failed to load the data")
            return nil
        }
    }
    
    func getSavedGame() -> GameDB? {
        let request: NSFetchRequest<GameDB> = GameDB.fetchRequest()
        
        do {
            return try viewContext.fetch(request).first
        } catch {
            dPrint("Failed to load the data")
            return nil
        }
    }
    
    func deleteGame(_ game: GameDB) {
        viewContext.delete(game)
        dPrint("DELETE LAST GAME")
        save()
    }
    
    func deleteCharacter(_ character: CharacterDB) {
        viewContext.delete(character)
        dPrint("DELETE LAST Character")
        save()
    }
}
