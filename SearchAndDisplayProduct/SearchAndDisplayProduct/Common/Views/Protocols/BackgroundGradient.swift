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
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 90)
        gradientLayer.colors = [UIColor.getColorWith(hex: "#fcd76f").cgColor, UIColor.white.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
