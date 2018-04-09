//
//  MainCityList.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit


class MainCityList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var city_table_view: UITableView!
    
    //has to have an array of cities, each time the app opens, it requests all the cities in the array
    var cities:[City]? = []
    var city_names:[String] = ["paris", "london", "lisbon"]
    var isCelsius:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload_list_cities()
    }
    
    func reload_list_cities(){
        
        for city_name in city_names{
            let request_city = Request_city()
            request_city.fetch_city(city_name:city_name) { (city) -> () in
                self.cities?.append(city)
                DispatchQueue.main.async {
                    self.city_table_view.reloadData()
                }
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city_cell", for: indexPath) as! MainListCell
        if let cities = cities{
            cell.city_name.text = cities[indexPath.item].name
            cell.city_country.text = cities[indexPath.item].country
            if isCelsius{
                cell.city_temp.text = "\(cities[indexPath.item].c_temp!) C"
            }
            else{
                cell.city_temp.text = "\(cities[indexPath.item].f_temp!) F"
            }
        }
        else{
            print("Error: there aren't any cities do show")
        }
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
