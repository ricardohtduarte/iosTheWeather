//
//  CityLocation.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 09/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class CityLocation: NSObject {
    var name:String?
    var region:String?
    var country:String?
    var lat:Double?
    var lon:Double?
    
    func fill_location(name:String, region:String, country:String, lat:Double, lon:Double){
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
    }
}
