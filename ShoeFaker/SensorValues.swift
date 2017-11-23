//
//  SensorValues.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 23-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation

struct SensorValue {
    
    let sensor1: UInt16,
        sensor2: UInt16,
        sensor3: UInt16,
        sensor4: UInt16,
        shoetype: Int
    
    init(sensor1: UInt16, sensor2: UInt16, sensor3: UInt16, sensor4: UInt16, shoetype: Int) {
        self.sensor1 = sensor1
        self.sensor2 = sensor2
        self.sensor3 = sensor3
        self.sensor4 = sensor4
        self.shoetype = shoetype
    }
    
}
