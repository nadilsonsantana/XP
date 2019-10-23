//
//  CoreDataManager.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 22/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: UIViewController {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "desafio_xp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveHeroes(heroes: Heroes?) {
        let context = persistentContainer.viewContext
        let localHeroes = LocalHeroes(context: context)
        let urlString = String(format: "%@.%@",heroes?.thumbnail?.path ?? "", heroes?.thumbnail?.extensionString ?? "" )
        localHeroes.heroImage = urlString
        do {
            try context.save()
        } catch {
            print ("error")
        }
    }
    
    func deleteHeroes(id: NSManagedObjectID) {
        let context = persistentContainer.viewContext
        let obj = context.object(with: id)
        context.delete(obj)
        try? context.save()
    }
    
    func loadHeroes(completion: ([LocalHeroes]?, Bool) -> Void)  {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LocalHeroes")
        
        do {
            let results = try context.fetch(fetchRequest)
            completion(results as? [LocalHeroes] ?? [], true)
        } catch {
            completion(nil, false)
        }
        
    }
}
