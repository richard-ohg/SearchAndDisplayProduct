//
//  Utils.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

struct Utils {
    static func formatPrice(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: value)) ?? "\(Int(value))"
    }
}
