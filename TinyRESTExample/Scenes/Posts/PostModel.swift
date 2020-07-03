//
//  Post.swift
//  TinyRESTExample
//
//  Created by troquer on 6/7/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation

struct Post: Codable, Identifiable  {
    var userId: Int
    var id: Int
    var title: String?
    var body: String?
}
