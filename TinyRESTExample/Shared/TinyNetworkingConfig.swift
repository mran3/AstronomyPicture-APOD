//
//  TinyNetworkingConfig.swift
//  TinyRESTExample
//
//  Created by troquer on 6/7/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation
import TinyNetworking

enum NasaAPI {
    case POTD(date: String = "today")
    case POTDs(startDate: String, endDate: String)
}

extension NasaAPI: Resource {
    
    var baseURL: URL {
      return URL(string: "https://api.nasa.gov/planetary")!
    }
    
    var endpoint: Endpoint {
        switch self {
        case .POTD(date: _):
            return .get(path: "/apod")
        case .POTDs(startDate: _, endDate: _):
            return .get(path: "/apod")
        }
    }
    
    var task: Task {
        var params: [String: Any] = [:]
        switch self {
            case let .POTD(date: potdDate):
                params = ["api_key": "DEMO_KEY", "date": potdDate]
                return .requestWithParameters(params, encoding: URLEncoding())
            case let .POTDs(startDate: startDate, endDate: endDate):
                params = ["api_key": "DEMO_KEY",
                          "start_date": startDate,
                          "end_date": endDate]
            return .requestWithParameters(params, encoding: URLEncoding())
            }
        }
    
    var headers: [String: String] {
      return ["Authorization": "Bearer xxx"]
    }
    
}
