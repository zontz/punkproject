////
//  BeerManagedObject.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/26/23.
//

import CoreData

extension BeerManagedObject {

    convenience init(context: NSManagedObjectContext, with apiModel: BeerAPI) {
        self.init(context: context)
        self.id = Int64(apiModel.id)
        self.abv = apiModel.abv
        self.attenuationLevel = apiModel.attenuationLevel
        self.boilVolume = BoilVolumeManagedObject(context: context, with: apiModel.boilVolume)
        self.brewersTips = apiModel.brewersTips
        self.contributedBy = apiModel.contributedBy.rawValue
        self.ebc = Int64(apiModel.ebc ?? 0)
        self.firstBrewed = apiModel.firstBrewed
        self.ibu = apiModel.ibu ?? 0
        self.imageURL = apiModel.imageURL
        self.name = apiModel.name
        self.ph = apiModel.ph ?? 0
        self.srm = apiModel.srm ?? 0
        self.tagline = apiModel.tagline
        self.targetFg = Int64(apiModel.targetFg)
        self.targetOg = apiModel.targetOg
        self.volume = BoilVolumeManagedObject(context: context, with: apiModel.volume)
    }
}

