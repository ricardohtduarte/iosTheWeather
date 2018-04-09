//
//  City.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class City: NSObject {
    var name:String?
    var country:String?
    var lat:Double?
    var lon:Double?
    var f_temp:Double?
    var c_temp:Double?
    
    func fill_city_info(name:String, country:String, lat:Double, lon:Double, f_temp:Double, c_temp:Double){
        self.name = name
        self.country = country
        self.lat = lat
        self.lon = lon
        self.f_temp = f_temp
        self.c_temp = c_temp
    }
    
}
