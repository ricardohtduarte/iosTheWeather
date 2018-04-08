//
//  MainCityList.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit


class MainCityList: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //has to have an array of cities, each time the app opens, it requests all the cities in the array
    var cities:[City]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload_list_cities()
    }
    
    func reload_list_cities(){
        let city_name:String = "paris"
        let request_city = Request_city()
        let city:City = request_city.fetchCity(name: city_name)
        print("Name: \(String(describing: city.name))")
        print("Country: \(String(describing: city.country))")
        print("Region: \(String(describing: city.region))")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city_cell", for: indexPath) as! MainListCell
        return cell
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
