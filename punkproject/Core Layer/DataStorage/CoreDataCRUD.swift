////
////  CoreDataCRUD.swift
////  punkproject
////
////  Created by Владислав Шляховенко on 6/26/23.
////
//
//import Foundation
//
//struct CoreDataCRUD<CoreDataObject: PlainCoreDataObjectTransformable> {
//
//    private let storageService: DataStorage
//
//    init(storageService: DataStorage) {
//        self.storageService = storageService
//    }
//
//
//    func create(from plainObject: CoreDataObject.PlainObject, completion: SuccessClosure) {
//        create(from: [plainObject], completion: completion)
//    }
//
//    func create(from plainObjects: [CoreDataObject.PlainObject], completion: SuccessClosure) {
//        guard let context = storageService.mainContext else {
//            completion(false, nil)
//            return
//        }
//        for plainObject in plainObjects {
//            CoreDataObject.create(from: plainObject, in: context)
//        }
//        do {
//            try context.saveToStore()
//            completion(true, nil)
//        } catch {
//            completion(false, error)
//        }
//    }
//}
