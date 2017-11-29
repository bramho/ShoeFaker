//
//  ShoeDataNormalizer.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 29-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation

class ShoeDataNormalizer {
    let MAX_PRESSURE_VALUE: Float = 600; // Maxiumum value the shoe will generate on average
    
    func normalizePressureValue(pressureValue: Float) -> Float {
        if pressureValue > MAX_PRESSURE_VALUE {
            // Is weird value
            return 1
        } else {
            return pressureValue / MAX_PRESSURE_VALUE
        }
    }
}
