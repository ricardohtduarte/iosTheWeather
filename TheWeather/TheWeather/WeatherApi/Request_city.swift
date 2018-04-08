//
//  Request_city.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class Request_city: NSObject {
    
    var get_city_url = "https://api.apixu.com/v1/current.json?key=ec4629c7d40f4a90a1e160602180804&q="
    
    func fetchCity(name:String) -> City{
        let city = City()
        let complete_url = get_city_url + name
        let url_request = URLRequest(url: URL(string: complete_url)!)
        let task = URLSession.shared.dataTask(with: url_request){(data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                if let city_location = json["location"] as? [String : AnyObject]{
                    if let name = city_location["name"],
                        let region = city_location["region"],
                        let country = city_location["country"],
                        let lat = city_location["lat"],
                        let lon = city_location["lon"]{
                        city.fill_city_location(name:name as! String, region:region as! String, country:country as! String,
                                                lat:lat as! Double, lon:lon as! Double)
                    }
                }
            }catch let error{
                print(error)
            }
        }
        task.resume()
       return city
    }
}
