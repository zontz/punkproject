//
//  BoilVolume.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import Foundation

// MARK: - BoilVolume
struct BoilVolume: Codable {
    let value: Double
    let unit: Unit
}


enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
}
