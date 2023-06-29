//
//  PlainObjectCoreDataTransformable.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/26/23.
//

import Foundation
import CoreData

protocol PlainCoreDataObjectTransformable {
    associatedtype PlainObject
    associatedtype CoreDataObject

    @discardableResult
    static func create(
        from plainObject: PlainObject,
        in context: NSManagedObjectContext
    ) -> CoreDataObject
    func fill(from plainObject: PlainObject)
    func toPlainObject() -> PlainObject
}
