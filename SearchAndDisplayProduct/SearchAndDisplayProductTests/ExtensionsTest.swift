//
//  ExtensionsTest.swift
//  SearchAndDisplayProductTests
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import XCTest

final class ExtensionsTest: XCTestCase {

    func testStringExtensionIsNotEmpty() {
        let string1 = ""
        let string2 = "Hola"
        XCTAssertFalse(string1.isNotEmpty)
        XCTAssertTrue(string2.isNotEmpty)
    }
}
