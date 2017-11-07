//
//  Palette.swift
//  TwicketSegmentedControlDemo
//
//  Created by Pol Quintana on 17/09/16.
//  Copyright © 2016 Pol Quintana. All rights reserved.
//

import UIKit

struct Palette {
    static let defaultTextColor = Palette.colorFromRGB(0, green: 0, blue: 0, alpha: 0.4)
    static let highlightTextColor = UIColor.white
    static let segmentedControlBackgroundColor = Palette.colorFromRGB(255, green: 255, blue: 255, alpha: 1)
    static let sliderColor = Palette.colorFromRGB(0, green: 0, blue: 0)

    static func colorFromRGB(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        func amount(_ amount: CGFloat, with alpha: CGFloat) -> CGFloat {
            return (1 - alpha) * 255 + alpha * amount
        }

        let red = amount(red, with: alpha)/255
        let green = amount(green, with: alpha)/255
        let blue = amount(blue, with: alpha)/255
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
