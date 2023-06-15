//
//  BeerProvider.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation

enum BeerProvider {
    case getAllBeers
    case getSingleBeer
    case getRandomBeer
}

extension BeerProvider: Request {
    var queryParams: [String : String]? {
        switch self {
        default:
            return nil
        }
    }

    var body: Any? {
        switch self {
        default:
            return nil
        }
    }

    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }

    var baseURL: String {
        switch self {
        default:
            return Routes.baseURL
        }
    }

    var path: String {
        switch self {
        case .getAllBeers:
            return Routes.allBeers
        case .getSingleBeer:
            return Routes.singleBeer
        case .getRandomBeer:
            return Routes.allBeers
        }
    }

    var apiVersion: String {
        switch self {

        default:
            return "/v2"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getAllBeers,
             .getRandomBeer,
             .getSingleBeer:
            return .GET
        }
    }

    var encoder: BodyDecoder? {
        switch self {

        default:
            return BodyJSONDecoder()
        }
    }
}
