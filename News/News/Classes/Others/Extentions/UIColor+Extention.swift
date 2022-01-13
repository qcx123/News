//
//  UIColor+Extention.swift
//  News
//
//  Created by xx on 2021/11/22.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        if #available(iOS 10.0, *) {
            self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        } else {
            // Fallback on earlier versions
            self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        }
    }
    
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
}
