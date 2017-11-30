//
//  AverageSensorValues.swift
//  ShoeFaker
//
//  Created by Geart on 30/11/2017.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation
import UIKit


class AverageSensorValue{
    var sensorOutlets:[UIView] = []
    
    @IBOutlet weak var rightShoeSensor1: UIView!
    @IBOutlet weak var rightShoeSensor2: UIView!
    @IBOutlet weak var rightShoeSensor3: UIView!
    @IBOutlet weak var rightShoeSensor4: UIView!


    // Left shoe sensor
    @IBOutlet weak var leftShoeSensor1: UIView!
    @IBOutlet weak var leftShoeSensor2: UIView!
    @IBOutlet weak var leftShoeSensor3: UIView!
    @IBOutlet weak var leftShoeSensor4: UIView!
    
    var MAX_AVERAGE_SENSOR_VALUE:Float = 0.0
    
    var MAX_AVERAGE_LEFT: Float = 0.0
    var MAX_AVERAGE_RIGHT: Float = 0.0
    
    func calculateMaxAverage(leftShoe: SensorValue, rightShoe: SensorValue, sensorOutletArray: [UIView]){
        
        if (MAX_AVERAGE_LEFT == 0.0) {
            MAX_AVERAGE_LEFT = (leftShoe.sensor1 + leftShoe.sensor2 + leftShoe.sensor3 + leftShoe.sensor4) / 4
        }
        
        if (MAX_AVERAGE_RIGHT == 0.0) {
            MAX_AVERAGE_RIGHT = (rightShoe.sensor1 + rightShoe.sensor2 + rightShoe.sensor3 + rightShoe.sensor4) / 4
        }
        
        //     RightSHoe       0.8 / 2 => 0.4 + (0.85 - 0.6) => 0.4 + 0.25 => 0.65
        //      LeftShoe        0.6 / 2 => 0.3 ====> 0.1 ====>
        sensorOutletArray[4].alpha = CGFloat((leftShoe.sensor1 / 2) + (MAX_AVERAGE_RIGHT - rightShoe.sensor1))
        sensorOutletArray[5].alpha = CGFloat((leftShoe.sensor2 / 2) + (MAX_AVERAGE_RIGHT - rightShoe.sensor2))
        sensorOutletArray[6].alpha = CGFloat((leftShoe.sensor3 / 2) + (MAX_AVERAGE_RIGHT - rightShoe.sensor3))
        sensorOutletArray[7].alpha = CGFloat((leftShoe.sensor4 / 2) + (MAX_AVERAGE_RIGHT - rightShoe.sensor4))
        
        sensorOutletArray[0].alpha = CGFloat((rightShoe.sensor1 / 2) + (MAX_AVERAGE_LEFT - leftShoe.sensor1))
        sensorOutletArray[1].alpha = CGFloat((rightShoe.sensor2 / 2) + (MAX_AVERAGE_LEFT - leftShoe.sensor2))
        sensorOutletArray[2].alpha = CGFloat((rightShoe.sensor3 / 2) + (MAX_AVERAGE_LEFT - leftShoe.sensor3))
        sensorOutletArray[3].alpha = CGFloat((rightShoe.sensor4 / 2) + (MAX_AVERAGE_LEFT - leftShoe.sensor4))
    }
    
}
