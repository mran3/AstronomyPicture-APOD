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
                VStack{
                    List {
                        ForEach(viewModel.arPictures,  id: \.date) { potd in
                            NavigationLink(destination: POTDDetailView(potd: potd)) {
                                Text(potd.title ?? "")
                            }
                        }
                    }
                }.navigationBarTitle(Text("Last 8 days pictures"), displayMode: .inline)
                    
            }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
