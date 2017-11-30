//
//  ViewController.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 23-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftShoeLabel: UILabel!
    @IBOutlet weak var rightShoeLabel: UILabel!
    
    @IBOutlet weak var leftShoeBar: UIView!
    @IBOutlet weak var rightShoeBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start interval
        ShoeFaker().scheduledTimerWithTimeInterval()
        
        // Listen for new data
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotNewShoeData(notification:)), name: Notification.Name("NewShoeData"), object: nil)
    }
    
    @objc func gotNewShoeData(notification: Notification) {
        let leftShoeData: SensorValue = notification.userInfo?["left_shoe"] as! SensorValue
        let rightShoeData: SensorValue = notification.userInfo?["right_shoe"] as! SensorValue
        
        displayValues(leftShoe: leftShoeData, rightShoe: rightShoeData)
    }
    
    func displayValues (leftShoe: SensorValue, rightShoe: SensorValue) {
        let leftShoeTotal = leftShoe.sensor1 + leftShoe.sensor2 + leftShoe.sensor3 + leftShoe.sensor4
        let rightShoeTotal = rightShoe.sensor1 + rightShoe.sensor2 + rightShoe.sensor3 + rightShoe.sensor4
        let overallTotal = leftShoeTotal + rightShoeTotal
        
        let leftShoePercentage = Int((leftShoeTotal / overallTotal) * 100)
        let rightShoePercentage = Int((rightShoeTotal / overallTotal) * 100)
        
        leftShoeLabel.text = String(leftShoePercentage) + "%"
        rightShoeLabel.text = String(rightShoePercentage) + "%"
        
        let leftShoeBarHeight = Int(500 * (leftShoeTotal / overallTotal))
        let rightShoeBarHeight = Int(500 * (rightShoeTotal / overallTotal))
        
        leftShoeBar.frame = CGRect(x: 97, y: (919 - leftShoeBarHeight), width: 100, height: leftShoeBarHeight)
        rightShoeBar.frame = CGRect(x: 585, y: (919 - rightShoeBarHeight), width: 100, height: rightShoeBarHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

