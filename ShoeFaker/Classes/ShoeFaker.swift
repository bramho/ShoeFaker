//
//  ShoeFaker.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 23-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation

class ShoeFaker {
    
    var timer = Timer()
    var liftLeftFoot = LiftFoot.init()
    var liftRightFoot = LiftFoot.init()
    
    // Starts interval
    func scheduledTimerWithTimeInterval () {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.generateShoeValues), userInfo: nil, repeats: true)
    }
    
    @objc func generateShoeValues () {
        
        let leftShoeValues = SensorValue(sensor1: getSensorValue(type: "LeftFoot"), sensor2: getSensorValue(type: "LeftFoot"), sensor3: getSensorValue(type: "LeftFoot"), sensor4: getSensorValue(type: "LeftFoot"))
        
        let rightShoeValues = SensorValue(sensor1: getSensorValue(type: "RightFoot"), sensor2: getSensorValue(type: "RightFoot"), sensor3: getSensorValue(type: "RightFoot"), sensor4: getSensorValue(type: "RightFoot"))
        
        let sensorValues: [String: SensorValue] = ["left_shoe": leftShoeValues, "right_shoe": rightShoeValues]
        
        // Posts sensor data to NotificationCenter
        NotificationCenter.default.post(name: Notification.Name("NewShoeData"), object: nil, userInfo: sensorValues)
        
        count()

    }
    
    func count () {
        
        if (!liftLeftFoot.isLifting && !liftRightFoot.isLifting && !liftLeftFoot.completedLifting) {
            // First time lifting foot -> lift left
            liftLeftFoot.isLifting = true
            liftLeftFoot.liftFoot()

        } else if (!liftLeftFoot.isLifting && !liftRightFoot.isLifting && liftRightFoot.completedLifting) {
            // No foots are lifting and the right foot just finished lifting -> reset and lift left foot
            liftRightFoot.completedLifting = false
            liftLeftFoot.resetFoot()
            
            liftLeftFoot.isLifting = true
            liftLeftFoot.liftFoot()

        } else if (liftLeftFoot.isLifting) {
            // Keep on lifting the left foot
            liftLeftFoot.liftFoot()

        } else if (!liftRightFoot.isLifting && !liftLeftFoot.isLifting && liftLeftFoot.completedLifting) {
            // No foots are lifting and the left foot just funished lifting -> reset and lift right foot
            liftLeftFoot.completedLifting = false
            liftRightFoot.resetFoot()
            
            liftRightFoot.isLifting = true
            liftRightFoot.liftFoot()

        } else if (liftRightFoot.isLifting) {
            // Keep on lifting the right fot
            liftRightFoot.liftFoot()

        }
        
        
    }
    
    func getValue(lowestValue: Int, highestValue: Int) -> Int {
        return Int.random(range: lowestValue...highestValue)
    }
    
    // Gets a normalized value for a sensor
    func getSensorValue (type: String) -> Float {
        
        var randomInt: Int = 0
        
        if (type == "LeftFoot") {
            randomInt = Int.random(range: getValue(lowestValue: liftLeftFoot.lowestValue, highestValue: liftLeftFoot.highestValue)...liftLeftFoot.highestValue)
        } else if (type == "RightFoot") {
            randomInt = Int.random(range: getValue(lowestValue: liftRightFoot.lowestValue, highestValue: liftRightFoot.highestValue)...liftRightFoot.highestValue)
        }
    
        return ShoeDataNormalizer().normalizePressureValue(pressureValue: Float(randomInt))
    }
}
