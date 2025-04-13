//
//  IntExtension.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import Foundation

extension Int {
    func toString() -> String {
        String(format: "%d", self)
    }
}

extension Int? {
    var orZero: Int {
        self ?? 0
    }
}
