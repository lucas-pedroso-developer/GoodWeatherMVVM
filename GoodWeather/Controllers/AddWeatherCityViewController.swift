//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Lucas Daniel on 31/07/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func AddWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=f4c657a51f69b2278f49475fc25b6141")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            WebService().load(resource: weatherResource) { [weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.AddWeatherDidSave(vm: weatherVM)
                        self!.dismiss(animated: true, completion: nil)
                    }
                }
            }
            
        }
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
