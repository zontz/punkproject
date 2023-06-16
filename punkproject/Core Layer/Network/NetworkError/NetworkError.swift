//
//  Error.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation

enum NetworkError: Error {
    case requestFailed
    case normalError(Error)
    case invalidURL
    case emptyErrorWithStatusCode(String)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "request failed"
        case .normalError(let error):
            return error.localizedDescription
        case .emptyErrorWithStatusCode(let status):
            return status
        case .invalidURL:
          return "URL string is malformed."
        default:
            return String(describing: self)
        }
    }
}
