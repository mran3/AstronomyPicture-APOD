//
//  POTDDetailView.swift
//  TinyRESTExample
//
//  Created by troquer on 7/4/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import SwiftUI
import URLImage

struct POTDDetailView: View {
    var potd: POTD
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 20) {
                Text(potd.title ?? "").bold()
                URLImage(URL(string: potd.url ?? "")!, content: {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .padding(.all, 4.0)
                })
                Text(potd.explanation ?? "")
            }.padding()
        }
    }
}

//Group {
//    VStack(alignment: .leading, spacing: 20) {
//        Text(potd.title ?? "")
//        Text(potd.explanation ?? "")
//    }.padding()
//}.background(URLImage(URL(string: potd.url ?? "")!, content: {
//    $0.image
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .clipShape(RoundedRectangle(cornerRadius: 5))
//        .padding(.all, 40.0)
//        .shadow(radius: 10.0)
//})
//)
