//
//  RequestManagerTest.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import XCTest

final class RequestManagerTest: XCTestCase {

    func testBuildGetProductsBySearchTerm() {
        Task {
            let result = await RequestManager.shared.fetchProducts(searchTerm: "Nike")
            XCTAssertNotNil(result)
        }
    }
}
