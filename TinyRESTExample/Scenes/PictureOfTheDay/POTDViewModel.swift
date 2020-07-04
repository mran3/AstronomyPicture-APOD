//
//  PostViewModel.swift
//  TinyRESTExample
//
//  Created by troquer on 6/7/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation
import TinyNetworking

class POTDViewModel: ObservableObject {
    
    @Published var arPictures: [POTD] = []
    
    init(){
        getPictures()
    }
    
    func getPictures(){
        let tinyNetworking = TinyNetworking<NasaAPI>()
        let resource: NasaAPI = .POTDs(startDate: "2020-07-02", endDate: "2020-07-04")
        
        tinyNetworking.request(resource: resource) { result in
            switch result {
            case let .success(response):
                if let receivedPictures = try? response.map(to: [POTD].self) {
                    self.arPictures = receivedPictures
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

