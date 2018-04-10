//
//  Request_search.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Request_search: NSObject {
    var get_search_url = "https://api.apixu.com/v1/search.json?key=ec4629c7d40f4a90a1e160602180804&q="
    
    func fetch_search_results(search_name:String, request_complete: @escaping ([CityLocation]) -> ()){
        var city_results:[CityLocation] = []
        let url:String = get_search_url + search_name
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    let response = JSON(responseData.result.value!)
                    if let city_locations = response.array{
                        for location_result in city_locations{
                            let city_location = CityLocation()
                            if let name = location_result["name"].string,
                                let region = location_result["region"].string,
                                let country = location_result["country"].string,
                                let lat = location_result["lat"].double,
                                let lon = location_result["lon"].double
                            {
                                city_location.fill_location(name: name, region: region, country: country, lat: lat, lon: lon)
                                city_results.append(city_location)
                                request_complete(city_results)
                            }
                            else{
                                print("ERROR: ")
                            }
                        }
                    }
                    else{
                        print("ERROR: Could not load search results")
                    }
                }
        }
    }
}
