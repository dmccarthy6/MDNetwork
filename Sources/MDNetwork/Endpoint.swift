//
//  Endpoint.swift
//
//
//  Created by Dylan  on 1/6/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

/// <#Description#>
protocol Endpoint {
    var method: HTTPMethod { get }
    var scheme: String { get }
    var host: String { get }
    var path: String { get }

    var headers: [String: String] { get }
    var parameters: [String: String] { get }
    var body: Data? { get }
}

extension Endpoint {
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []

        parameters.forEach { dict in
            items.append(URLQueryItem(name: dict.key, value: dict.value))
        }
        return items
    }

    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components
    }

    var url: URL {
        guard let url = urlComponents.url else {
            fatalError("Invalid URL")
        }
        return url
    }

    var urlRequest: URLRequest {
       var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.allHTTPHeaderFields = headers
        return request
    }
}
