//
//  s.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import Foundation

// MARK: - Method
struct Method: Codable {
    let mashTemp: [MashTemp]
    let fermentation: Fermentation
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}
