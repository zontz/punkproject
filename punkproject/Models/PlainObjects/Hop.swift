//
//  h.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import Foundation

// MARK: - Hop
struct Hop: Codable {
    let name: String
    let amount: BoilVolumeAPI
    let add: Add
    let attribute: Attribute
}

enum Attribute: String, Codable {
    case aroma = "aroma"
    case attributeFlavour = "Flavour"
    case bitter = "bitter"
    case flavour = "flavour"
}


enum Add: String, Codable {
    case dryHop = "dry hop"
    case end = "end"
    case middle = "middle"
    case start = "start"
}
