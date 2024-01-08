//
//  TestEndpoint.swift
//  
//
//  Created by Dylan  on 1/6/24.
//

import XCTest
@testable import MDNetwork

final class TestEndpoint: XCTestCase {
    var method: HTTPMethod!
    var host: String!
    var path: String!
    var headers: [String: String]!
    var parameters: [String: String]!
    var endpoint: MockEndpoint!

    override func setUpWithError() throws {
        method = .post
        host = "www.mansdownindustries.com"
        path = "/test"
        headers = [:]
        parameters = [:]
        endpoint = MockEndpoint(method: method,
                                host: host,
                                path: path,
                                headers: headers,
                                parameters: parameters)
    }

    func testURLExists() throws {
        XCTAssertNotNil(endpoint.url, "URL is nil")
    }

    func testURLRequest() throws {
        let request = endpoint.urlRequest

        XCTAssertNotNil(request, "URL request is nil")
        XCTAssertEqual(request.httpMethod, method.rawValue)
        XCTAssertEqual(request.allHTTPHeaderFields, headers)
        XCTAssertEqual(request.url, endpoint.url)
    }

    override func tearDownWithError() throws {
        method = nil
        host = nil
        path = nil
        headers = nil
        parameters = nil
        endpoint = nil
    }
}
