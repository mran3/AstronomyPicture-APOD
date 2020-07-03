//
//  ContentView.swift
//  TinyRESTExample
//
//  Created by troquer on 6/6/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PostsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.arPosts) { post in
                Text(post.title ?? "")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
