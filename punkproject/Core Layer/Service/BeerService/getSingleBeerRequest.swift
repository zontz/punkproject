//
//  getSingleBeerRequest.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/20/23.
//

import Foundation


struct getSingleBeerRequest: Request {
    var path: String = "/beers/1"
    var apiVersion: String = "/v2"
    var httpMethod: HTTPMethod = .get
}

