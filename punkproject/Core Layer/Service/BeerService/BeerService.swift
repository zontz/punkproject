//
//  BeerService.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation
import Combine

protocol BeerService: AnyObject {
    func getAllBeers() -> AnyPublisher<[BeerAPI], NetworkError>
}

final class BeerServiceImpl: BeerService {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func getAllBeers() -> AnyPublisher<[BeerAPI], NetworkError> {
        let request = getSingleBeerRequest().createURLRequest()
        return networkManager.publisher(request, decodingType: [BeerAPI].self)
    }
}
