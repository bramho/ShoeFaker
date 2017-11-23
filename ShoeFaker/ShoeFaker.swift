//
//  ShoeFaker.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 23-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation

class ShoeFaker {
    let MAX_PRESSURE_VALUE: UInt16 = 1000; // Maxiumum value
    var timer = Timer()
    
    // Starts interval
    func scheduledTimerWithTimeInterval () {
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(self.generateShoeValues), userInfo: nil, repeats: true)
    }
    
    @objc func generateShoeValues () {
        
        let leftShoeValues = SensorValue(sensor1: UInt16(generateRandomValue()), sensor2: UInt16(generateRandomValue()), sensor3: UInt16(generateRandomValue()), sensor4: UInt16(generateRandomValue()), shoetype: 1)
        
        let rightShoeValues = SensorValue(sensor1: UInt16(generateRandomValue()), sensor2: UInt16(generateRandomValue()), sensor3: UInt16(generateRandomValue()), sensor4: UInt16(generateRandomValue()), shoetype: 2)
        
        let sensorValues: [String: SensorValue] = ["left_shoe": leftShoeValues, "right_shoe": rightShoeValues]
        
        // Posts sensor data to NotificationCenter
        NotificationCenter.default.post(name: Notification.Name("NewShoeData"), object: nil, userInfo: sensorValues)

    }
    
    // Generates random value
    func generateRandomValue () -> Int16 {
        return Int16(arc4random_uniform(UInt32(MAX_PRESSURE_VALUE)))
    }
}
