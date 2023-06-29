import Foundation
import Combine
import CoreData
import Swinject

protocol NetworkManager: AnyObject {
    func publisher<T>(_ request: URLRequest, decodingType: T.Type) -> AnyPublisher<T, NetworkError> where T: Decodable
}

final class NetworkManagerImpl: NetworkManager {

    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
      self.urlSession = urlSession
    }

    func publisher<T>(_ request: URLRequest, decodingType: T.Type) -> AnyPublisher<T, NetworkError> where T: Decodable {
        return urlSession.dataTaskPublisher(for: request)
            .tryMap({ result in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    throw NetworkError.requestFailed
                }
                self.log("status code for \(String(request.httpMethod ?? "")) \(request) is \(httpResponse.statusCode)")
                if (200..<300) ~= httpResponse.statusCode {
                    return result.data
                } else {
                    throw NetworkError.emptyErrorWithStatusCode(httpResponse.statusCode.description)
                }
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error -> NetworkError in
                if let error = error as? NetworkError {
                    return error
                }
                return NetworkError.normalError(error)
            })
            .eraseToAnyPublisher()
    }
}

extension NetworkManagerImpl: LogCompatible {
    var logger: Logger {
        Logger(prefix: "[NetworkManager]")
    }
}

protocol Logic {
    func hi()
}
class SimpleLogic: Logic {
    func hi() {
        print("s")
    }
}

class CryptoLogic: Logic {
    func hi() {
        print("b")
    }
}


final class DefaultDIManager {
    let container = Container()

//    func makeCryptoLogic
}
