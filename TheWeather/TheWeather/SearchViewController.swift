//
//  SecondViewController.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

protocol PassCoordsDelegate: class{
    func tap_search_cell(lat:Double, lon:Double)
}

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var search_table_view: UITableView!
    @IBOutlet weak var search_bar: UISearchBar!
    
    var search_results:[CityLocation]? = []
    weak var pass_coords_delegate:PassCoordsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let user_input = searchBar.text{
            print("teste")
            print("\(user_input)")
            reload_search_data(user_input:user_input)
        }
        else{
            print("Error: empty input in search bar")
        }
        
    }
    
    func reload_search_data(user_input:String){
        let request_search = Request_search()
        request_search.fetch_search_results(search_name: user_input){(results) -> () in
            self.search_results = results
            DispatchQueue.main.async {
                self.search_table_view.reloadData()
            }
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search_results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = search_table_view.dequeueReusableCell(withIdentifier: "search_cell", for: indexPath) as! SearchCityCell
        if let results = search_results{
            cell.city_label.text = results[indexPath.item].name
        }
        else{
            print("Error: there aren't any results do show")
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*if let results = search_results{
            let mainView = storyboard?.instantiateViewController(withIdentifier: "main_list") as! MainCitiesViewController
            mainView.addToCityCoords(coords: (results[indexPath.item].lat!, results[indexPath.item].lon!))
        }
        else{
            print("Error clicking in item, error unwrapping search_results")
        }
        */
    }
}










