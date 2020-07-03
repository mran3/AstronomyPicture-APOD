//
//  PostViewModel.swift
//  TinyRESTExample
//
//  Created by troquer on 6/7/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation
import TinyNetworking

class PostsViewModel: ObservableObject {
    
    @Published var arPosts: [Post] = []
    
    
    init(){
        getPosts()
    }
    
    func getPosts(){
        let tinyNetworking = TinyNetworking<TinyREST>()
        
        tinyNetworking.request(resource: .allPosts) { result in
            switch result {
            case let .success(response):
                if let receivedPosts = try? response.map(to: [Post].self) {
                    self.arPosts = receivedPosts
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

