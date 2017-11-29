//
//  GenerateRandomValue.swift
//  ShoeFaker
//
//  Created by Bram Honingh on 29-11-17.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation

extension Int {
    static func random(range: CountableClosedRange<Int>) -> Int {
        let MAX_RANDOM_VALUE: UInt32 = UInt32(range.upperBound)
        let MIN_RANDOM_VALUE: UInt32 = UInt32(range.lowerBound)
        
        return Int(arc4random_uniform(MAX_RANDOM_VALUE - MIN_RANDOM_VALUE) + MIN_RANDOM_VALUE)
    }
}
