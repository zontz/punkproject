//
//  Request.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation


protocol Request {
    var baseURL: String { get }
    var path: String { get }
    var apiVersion: String { get }
    var httpMethod: HTTPMethod { get }
    var queryParams: [String: String]? { get }
    var body: Any? { get }
    var encoder: BodyDecoder? { get }
    var headers: [String: String]? { get }
}

extension Request {

    var params: [String: Any] {
        [:]
    }

    var urlParams: [String: String?] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }

    func createURLRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = apiVersion + path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }

        guard let url = components.url else { return URLRequest(url: URL(string: baseURL)!) }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        if !params.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }

        return urlRequest
    }
}
