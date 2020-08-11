//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Lucas Daniel on 07/08/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
