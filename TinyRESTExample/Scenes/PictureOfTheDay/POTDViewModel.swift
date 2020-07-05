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
        let dates = getDates()
        let resource: NasaAPI = .POTDs(startDate: dates.1, endDate: dates.0)
        
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
    
    func getDates() -> (String, String) {
        let today = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let formattedDate = format.string(from: today)
        
        let lastWeekDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: today)!
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let lastWeekDateString = dateFormatter.string(from: lastWeekDate)
        
        return (formattedDate, lastWeekDateString)
        
    }
    
}

