//
//  ContentView.swift
//  TinyRESTExample
//
//  Created by troquer on 6/6/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = POTDViewModel()
    
    var body: some View {
        
        NavigationView {
            
            // Main view (by default shows on iPhone but not on iPad)
            VStack{
                List {
                    ForEach(viewModel.arPictures,  id: \.date) { potd in
                        NavigationLink(destination: POTDDetailView(potd: potd)) {
                            Text(potd.title ?? "")
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }.navigationBarTitle(Text("Last 8 days pictures"), displayMode: .inline)
            
            
            // Detail view (by default shows on iPad but not on iPhone)
            if (!viewModel.arPictures.isEmpty){
                POTDDetailView(potd: viewModel.arPictures[0])
            }
            
        }
    }
    
    init() {
        UITableView.appearance().separatorStyle = .singleLine
        UITableViewCell.appearance().backgroundColor = .darkGray
        UITableView.appearance().backgroundColor = .black
        UITableView.appearance().separatorColor = .darkGray
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
