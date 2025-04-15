//
//  UIViewExtension.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }

    func setCornerRadius(withValue value: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = value
    }
}
