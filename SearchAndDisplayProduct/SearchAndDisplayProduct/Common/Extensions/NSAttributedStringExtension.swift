//
//  NSAttributedStringExtension.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import Foundation

extension NSAttributedString {
    func concatenated(with other: NSAttributedString) -> NSAttributedString {
        let mutableCopy = NSMutableAttributedString(attributedString: self)
        mutableCopy.append(other)
        return mutableCopy
    }
}
