//
//  BeerService.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation
import Combine

protocol BeerService: AnyObject {
    func getAllBeers() -> AnyPublisher<[Beer], NetworkError>
}

class BeerServiceImpl: BeerService {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func getAllBeers() -> AnyPublisher<[Beer], NetworkError> {
        let request = BeerProvider.getAllBeers.createURLRequest()
        return networkManager.publisher(request, decodingType: [Beer].self, decoder: BodyJSONDecoder())
    }
}
