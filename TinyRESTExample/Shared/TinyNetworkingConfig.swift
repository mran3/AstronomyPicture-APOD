//
//  TinyNetworkingConfig.swift
//  TinyRESTExample
//
//  Created by troquer on 6/7/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation
import TinyNetworking

enum TinyREST {
    case allPosts
}

extension TinyREST: Resource {
    
    var baseURL: URL {
      return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var endpoint: Endpoint {
        switch self {
        case .allPosts:
            return .get(path: "/posts")
        }
    }
    
    var task: Task {
       var params: [String: Any] = [:]
       return .requestWithParameters(params, encoding: URLEncoding())
     }
    
    var headers: [String: String] {
      return ["Authorization": "Bearer xxx"]
    }
    
    
    
    
    
}
