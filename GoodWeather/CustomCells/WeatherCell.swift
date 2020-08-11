//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Lucas Daniel on 03/08/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var teperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel?.text = vm.name
        self.teperatureLabel?.text = "\(vm.currentTemperature.temperature.formatAsDegree)"
    }
    
}

