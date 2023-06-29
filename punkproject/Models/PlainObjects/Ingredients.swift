//
//  u.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import Foundation

// MARK: - Ingredients
struct Ingredients: Codable {
    let malt: [Malt]
    let hops: [Hop]
    let yeast: String
}
