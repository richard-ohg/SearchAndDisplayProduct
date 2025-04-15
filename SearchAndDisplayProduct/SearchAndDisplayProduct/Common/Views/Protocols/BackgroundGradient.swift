//
//  BackgroundGradient.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

protocol BackgroundGradientProtocol {
    func addGradient()
}

extension BackgroundGradientProtocol where Self : UIView{
    func addGradient() {
        layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: ViewValues.widthScreen, height: ViewValues.gradientHeight)
        gradientLayer.colors = [Colors.gradientPrimaryColor.cgColor, Colors.gradientSecondColor.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
