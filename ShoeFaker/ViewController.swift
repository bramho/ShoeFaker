//
//  ViewController.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 23-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightShoe: UIView!
    @IBOutlet weak var leftShoe: UIView!
    
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
        
        
        leftShoe.alpha = CGFloat(leftShoeData.sensor1)
        rightShoe.alpha = CGFloat(rightShoeData.sensor1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

