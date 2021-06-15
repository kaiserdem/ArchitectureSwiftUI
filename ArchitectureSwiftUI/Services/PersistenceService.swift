//
//  PersistenceService.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import CoreData
import Foundation

final class PersistenceService {
    private lazy var context = persistentContainer.viewContext
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ArchitectureUI")
        container.loadPersistentStores(completionHandler: { [unowned container] (storeDescription, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    init() {
        addAnimalsIfNoneExist()
    }

    func getAnimals() -> [Animal] {
        let request: NSFetchRequest<Animal> = Animal.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print(error)
            return []
        }
    }

    private func addAnimalsIfNoneExist() {
        guard getAnimals().isEmpty else { return }

        let createAnimal: (String) -> Void = { [weak self] name in
            guard let self = self else { return }
            let animal = Animal(context: self.context)
            animal.id = UUID()
            animal.name = name
        }

        ["dog", "cat", "fox", "bee", "pig"].forEach { createAnimal($0) }

        saveContext()
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
