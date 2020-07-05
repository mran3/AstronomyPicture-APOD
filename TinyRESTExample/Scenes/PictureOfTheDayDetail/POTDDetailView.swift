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
                Text(potd.title ?? "")
                    .bold().foregroundColor(Color.white).font(.system(size: 25))
                    
                URLImage(URL(string: potd.url ?? "")!, content: {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .padding(.all, 4.0)
                })
                Text("Explanation")
                    .foregroundColor(Color.white).bold()
                Text(potd.explanation ?? "").foregroundColor(Color.white)
                HStack{
                    Text("Copyright")
                        .foregroundColor(Color.white).bold()
                    Text(potd.copyright ?? "")
                        .foregroundColor(Color.white)
                    Text("Date of the POTD")
                        .foregroundColor(Color.white).bold()
                    Text(potd.date ?? "")
                        .foregroundColor(Color.white)
                }
            }.padding()
        }.background(Color(UIColor.darkGray))
    }
}
