//
//  StackViewExtension.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

extension UIStackView {
    func addSuviews(_ subviews: UIView...) {
        for subview in subviews {
            self.addArrangedSubview(subview)
        }
    }
}
