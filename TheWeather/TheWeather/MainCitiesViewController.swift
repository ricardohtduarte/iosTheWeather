//
//  MainCityList.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class MainCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var city_table_view: UITableView!
    var city_to_pass:City?
   
    //has to have an array of cities, each time the app opens, it requests all the cities in the array
    var cities:[City]? = []
    var cities_coords:[String] = []
    var isCelsius:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !cities_coords.isEmpty{
            reload_list_cities()
        }
    }
    
    @IBAction func add_btn_action(_ sender: Any) {
        let search_vc = storyboard?.instantiateViewController(withIdentifier: "search_list") as! SearchViewController
        search_vc.pass_coords_delegate = self
        present(search_vc, animated: true, completion: nil)
        
    }
    
    
    
    func reload_list_cities(){
        for city_coords in cities_coords{
            request_city_info(name: city_coords)
        }
    }

    
    func request_city_info(name:String){
        let request_city = Request_city()
        request_city.fetch_city(name:name) { (city) -> () in
            self.cities?.append(city)
            DispatchQueue.main.async {
                self.city_table_view.reloadData()
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
            cell.city_weather_image.downloadImage(from: (cities[indexPath.item].condition_icon)!)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        city_to_pass = cities?[indexPath.item]
        performSegue(withIdentifier: "city_to_forecast", sender: city_to_pass)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let forecastVC = segue.destination as! CityForecastViewController
        forecastVC.city = sender as? City
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

extension MainCitiesViewController:PassCoordsDelegate{
    func tap_search_cell(name:String) {
        cities_coords.append(name)
        request_city_info(name:name)
    }
}

extension UIImageView{
    func downloadImage(from url: String){
        let complete_url = "https:" + url
        let urlRequest = URLRequest(url: URL(string:complete_url)!)
        let task = URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data:data!)
            }
        }
        task.resume()
    }
}



