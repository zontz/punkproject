//
//  BoilVolumeManagedObject.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/29/23.
//

import CoreData

extension BoilVolumeManagedObject {
    convenience init(context: NSManagedObjectContext, with apiModel: BoilVolumeAPI) {
        self.init(context: context)
        self.unit = apiModel.unit.rawValue
        self.value = apiModel.value
    }
}
