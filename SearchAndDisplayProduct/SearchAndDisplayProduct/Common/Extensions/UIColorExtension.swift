//
//  UIColorExtension.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import UIKit.UIColor

extension UIColor {
    static func getColorWith(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        return UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                            alpha: alpha)
    }
}
