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
    var headers: [String: String] { get }
}

extension Request {

    var baseURL: String {
        let selectServerService = SelectServerServiceImpl()
        return selectServerService.getServerHost()
    }

    var queryParams: [String: String]? {
        nil
    }

    var urlParams: [String: String?] {
        [:]
    }

    var headers: [String: String] {
        ["Content-Type": "application/json"]
    }

    func createURLRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = apiVersion + path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        // MARK: - Question
        let url: URL = components.url ?? URL(string: "")!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        if let params = queryParams {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }

        return urlRequest
    }
}
