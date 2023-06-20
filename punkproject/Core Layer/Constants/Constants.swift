//
//  Routes.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation

enum Routes {

    static let baseURL: String = {
        let selectServerService = SelectServerServiceImpl()
        return selectServerService.getServerHost()
    }()

    static let allBeers = "/beers"
    static let randomBeer = "/beers/random"
    static let singleBeer = "/beers/1"
}


