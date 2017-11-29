//
//  SensorValues.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 23-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation

struct SensorValue {
    
    let sensor1: Float,
        sensor2: Float,
        sensor3: Float,
        sensor4: Float
    
    init(sensor1: Float, sensor2: Float, sensor3: Float, sensor4: Float) {
        self.sensor1 = sensor1
        self.sensor2 = sensor2
        self.sensor3 = sensor3
        self.sensor4 = sensor4
    }
    
}
