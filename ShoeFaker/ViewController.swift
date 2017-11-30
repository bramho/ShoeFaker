//
//  ViewController.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 23-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Right shoe sensors
    @IBOutlet weak var rightShoeSensor1: UIView!
    @IBOutlet weak var rightShoeSensor2: UIView!
    @IBOutlet weak var rightShoeSensor3: UIView!
    @IBOutlet weak var rightShoeSensor4: UIView!
    
    
    // Left shoe sensor
    @IBOutlet weak var leftShoeSensor1: UIView!
    @IBOutlet weak var leftShoeSensor2: UIView!
    @IBOutlet weak var leftShoeSensor3: UIView!
    @IBOutlet weak var leftShoeSensor4: UIView!
    
    var sensorOutlets:[UIView] = []
    
    var shoeFaker = ShoeFaker()
    var averageSensorValues = AverageSensorValue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sensorOutlets = [rightShoeSensor1!,rightShoeSensor2!,rightShoeSensor3!,rightShoeSensor4!,leftShoeSensor1!,leftShoeSensor2!,leftShoeSensor3!,leftShoeSensor4!]
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start interval
        shoeFaker.scheduledTimerWithTimeInterval()
        
        // Listen for new data
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewShoeData(notification:)), name: Notification.Name("NewShoeData"), object: nil)
        
    }
    
    @objc func gotNewShoeData(notification: Notification) {
        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
        averageSensorValues.calculateMaxAverage(leftShoe: leftShoeData, rightShoe: rightShoeData, sensorOutletArray: sensorOutlets)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

