//
//  MockEndpoint.swift
//
//
//  Created by Dylan  on 1/6/24.
//

import Foundation
@testable import MDNetwork

struct MockEndpoint: Endpoint {
    var method: MDNetwork.HTTPMethod
    var scheme: String = "https"
    var host: String
    var path: String
    var headers: [String : String]
    var parameters: [String : String]
    var body: Data? = nil
}
