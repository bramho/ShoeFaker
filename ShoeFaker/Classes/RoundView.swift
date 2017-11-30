//
//  RoundView.swift
//  ShoeFaker
//
//  Created by Geart on 30/11/2017.
//  Copyright © 2017 Bram Honingh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
