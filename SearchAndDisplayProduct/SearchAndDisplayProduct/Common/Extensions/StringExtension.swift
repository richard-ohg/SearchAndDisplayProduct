//
//  StringExtension.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import UIKit

extension String {
    static var empty: String {
        return String()
    }
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }

    func attributed(with font: UIFont, color: UIColor = Colors.defaultLabel) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [.font: font, .foregroundColor: color])
    }
}

extension String? {
    var orEmpty: String {
        self ?? ""
    }
    
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
