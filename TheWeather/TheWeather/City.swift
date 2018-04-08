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
    var region:String?
    var country:String?
    var lat:Double?
    var lon:Double?
    
    func fill_city_location(name:String, country:String){
        self.name = name
        self.country = country
    }
    
}
