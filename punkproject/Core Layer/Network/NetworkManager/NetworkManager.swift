//
//  NetworkManager.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation
import Combine

protocol NetworkManager: AnyObject {
    func publisher<T>(_ request: URLRequest, decodingType: T.Type, decoder: BodyDecoder) -> AnyPublisher<T, NetworkError> where T: Decodable
}

final class NetworkManagerImpl: NetworkManager {

    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
      self.urlSession = urlSession
    }

    func publisher<T>(_ request: URLRequest, decodingType: T.Type, decoder: BodyDecoder) -> AnyPublisher<T, NetworkError> where T: Decodable {
        return urlSession.dataTaskPublisher(for: request)
            .tryMap({ result in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    throw NetworkError.requestFailed
                }
                print(httpResponse.statusCode)
                if (200..<300) ~= httpResponse.statusCode {
                    return result.data
                } else {
                    throw NetworkError.emptyErrorWithStatusCode(httpResponse.statusCode.description)
                }
            })
            .decode(type: T.self, decoder: decoder.decoder())
            .mapError({ error -> NetworkError in
                if let error = error as? NetworkError {
                    return error
                }
                return NetworkError.normalError(error)
            })
            .eraseToAnyPublisher()
    }
}
