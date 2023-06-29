//
//  DataStorage.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/25/23.
//

import CoreData
import Foundation

protocol StorageService {
    var mainContext: NSManagedObjectContext? { get }
    func load(blank: Bool, completion: @escaping (_ success: Bool, _ error: Error?) -> Void)
}

final class StorageServiceImpl: StorageService {

    private static let name = "punkproject"
//
//    private static var model = {
//        NSManagedObjectModel(name: name)
//    }()

    var mainContext: NSManagedObjectContext?

    private var storage: CoreDataStorage?

    func load(blank: Bool, completion: @escaping (Bool, Error?) -> Void) {
        guard storage == nil else {
            return completion(true, nil)
        }

//        storage = CoreDataStorage(name: Self.name, managedObjectModel: <#T##NSManagedObjectModel?#>)
    }
}

final class CoreDataStorage {

    let container: NSPersistentContainer

    var mainContext: NSManagedObjectContext {
        container.viewContext
    }

    init(name: String,
         managedObjectModel: NSManagedObjectModel?,
         autoMigrate: Bool = false,
         blank: Bool = false,
         protection: FileProtectionType = .none)
    {
        container =  NSPersistentContainer(name: name)
        let defaultURL = NSPersistentContainer.defaultDirectoryURL()
        let description = NSPersistentStoreDescription(url: defaultURL)

        if autoMigrate {
            description.shouldMigrateStoreAutomatically = true
            description.shouldInferMappingModelAutomatically = true
        }
    }

    func loadPersistentStore(_ completion: @escaping (Error?) -> Void) {
        container.loadPersistentStores { _, error in
            completion(error)
        }
    }

    func clearPersistentsStores(_ completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        let coordinator = container.persistentStoreCoordinator

        do {
            try coordinator.persistentStores.forEach {
                try coordinator.remove($0)
            }
            completion(true, nil)
        } catch {
            completion(false, error)
        }
    }
}
