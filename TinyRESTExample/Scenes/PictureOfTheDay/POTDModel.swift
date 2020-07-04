//
//  Post.swift
//  TinyRESTExample
//
//  Created by troquer on 6/7/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation

struct POTD: Codable {
    var copyright: String?
    var date: String?
    var explanation: String?
    var url: String?
    var title: String?
}
