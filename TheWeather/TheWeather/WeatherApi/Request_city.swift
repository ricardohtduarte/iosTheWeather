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
    
    func fetch_city(city_name:String, request_complete: @escaping (City) -> ()){
        let url:String = get_city_url + city_name
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    let response = JSON(responseData.result.value!)
                    if let city_location = response["location"].dictionaryObject{
                        if let name = city_location["name"] as? String,
                                let country = city_location["country"] as? String
                    
                        {
                            let city = City()
                            city.fill_city_location(name: name, country: country)
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
