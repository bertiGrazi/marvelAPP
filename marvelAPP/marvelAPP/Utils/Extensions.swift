//
//  Extensions.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
           return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
       }
    
    static let primaryTextColor = UIColor.rgb(red: 240, green: 240, blue: 245)
}
