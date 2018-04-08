//
//  MainListCell.swift
//  TheWeather
//
//  Created by Ricardo Duarte on 08/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class MainListCell: UITableViewCell {

    @IBOutlet weak var city_name: UILabel!
    @IBOutlet weak var city_country: UILabel!
    @IBOutlet weak var city_temp: UILabel!
    @IBOutlet weak var city_weather_image: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
