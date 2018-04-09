//
//  SearchCityCell.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 09/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class SearchCityCell: UITableViewCell {

    @IBOutlet weak var city_label: UILabel!
    @IBOutlet weak var region_label: UILabel!
    @IBOutlet weak var country_label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
