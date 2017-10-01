//
//  DataModel.swift
//  SwiftSample
//
//  Created by BankOfAmerica on 9/30/17.
//  Copyright © 2017 Vimal. All rights reserved.
//

import Foundation

struct CountryDetails {
    let country : String
    let countryName : String
    let countryAbbre : String
    let countryMiles : String
    let countryLargestCity : String
    let countryCapital : String
}

extension CountryDetails {
    
    init?(json: [String: Any]) {
        
        guard let country = json["country"] as? String,
        let countryName = json[""] as? String,
        let countryAbbre = json[""] as? String,
        let countryMiles = json[""] as? String,
        let countryLargestCity = json[""] as? String,
        let countryCapital = json[""] as? String
            else{
                return nil
        }
        
        self.country = country
        self.countryName = countryName
        self.countryAbbre = countryAbbre
        self.countryCapital = countryCapital
        self.countryMiles = countryMiles
        self.countryLargestCity = countryLargestCity
    
    }
}
