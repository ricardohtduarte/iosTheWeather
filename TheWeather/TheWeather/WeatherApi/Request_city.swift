//
//  Request_city.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class Request_city: NSObject {
    
    var get_city_url = "https://api.apixu.com/v1/current.json?key=ec4629c7d40f4a90a1e160602180804&q="
    
    func fetch_city(request_complete: @escaping (City) -> ()){
        Alamofire.request("https://api.apixu.com/v1/current.json?key=ec4629c7d40f4a90a1e160602180804&q=paris", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    let response = JSON(responseData.result.value!)
                    if let city_location = response["location"].dictionaryObject{
                        if let name = city_location["name"] as? String,
                                let region = city_location["region"] as? String,
                                let country = city_location["country"] as? String,
                                let lat = city_location["lat"] as? Double,
                                let lon = city_location["lon"] as? Double
                        {
                            let city = City()
                            city.name = name
                            city.country = country
                            city.region = region
                            city.lat = lat
                            city.lon = lon
                            request_complete(city)
                        }
                        else{
                            print("Could not load city attributes")
                        }
                    }
                    else{
                        print("Could not load location/current city property")
                    }
                }
        }
    }
}
