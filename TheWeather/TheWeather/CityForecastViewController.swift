//
//  CityForecastViewController.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 12/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class CityForecastViewController: UIViewController {

    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var lat_label: UILabel!
    @IBOutlet weak var lon_label: UILabel!
    @IBOutlet weak var temp_label: UILabel!
    @IBOutlet weak var text_label: UILabel!
    @IBOutlet weak var wind_label: UILabel!
    @IBOutlet weak var precipitation_label: UILabel!
    @IBOutlet weak var humidity_label: UILabel!
    
    var city:City? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let city = city{
            name_label.text = city.name
            print(city.lat)
            print(city.lon)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
