//
//  CoreDataStack.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private init() {}
    
    var modelName: String = "" {
        
        didSet {
            
            persistentContainer = NSPersistentContainer(name: modelName)
            persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
                
                if let error = error as NSError? {}
            })
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {}
        })
        return container
    }()
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
            }
        }
    }
    
    func deleteAllData() {
        
        let context = persistentContainer.viewContext
        let entities = persistentContainer.managedObjectModel.entities
        
        for entity in entities {
            
            if let entityName = entity.name {
                
                let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
                
                do {
                    
                    let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                    objects?.forEach { context.delete($0) }
                    
                    try context.save()
                    
                } catch let error {}
            }
        }
    }
}

