//
//  URLBuilderTest.swift
//  SearchAndDisplayProductTests
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//

import XCTest

final class URLBuilderTest: XCTestCase {

    func testBuildValidBaseURL() {
        let builder = URLBuilder()
        XCTAssertEqual(builder.scheme, "https")
        XCTAssertEqual(builder.method, Method.GET)
        XCTAssertEqual(builder.getUrl(), URL(string: "https://api.mercadolibre.com"))
    }
    
    func testBuildInvalidURL() {
        var builder = URLBuilder(baseUrl: "example.com")
        builder.config(path: .custom("//@3`-"))
        XCTAssertNil(builder.getUrl())
    }
    
    func testBuildForceSchemeURL() {
        let builder = URLBuilder(baseUrl: "http://example.com/")
        XCTAssertEqual(builder.getUrl(), URL(string: "https://example.com/"))
    }

    func testBuildOverrideSchemeURL() {
        var builder = URLBuilder(baseUrl: "http://example.com/")
        builder.config(scheme: "ftp")
        XCTAssertEqual(builder.getUrl(), URL(string: "ftp://example.com/"))
    }
    
    func testBuildWithQueryParams() {
        var builder = URLBuilder()
        let params: [String : Any] = ["status": "active", "site_id": "MLM", "q": "iphone"]
        builder.config(path: .searchProduct, queryParams: params)
        XCTAssertEqual(builder.getUrl(), URL(string: "https://api.mercadolibre.com/products/search?status=active&site_id=MLM&q=iphone"))
    }
    
    func testBuildPostUrlRequest() {
        var builder = URLBuilder()
        builder.config(path: .searchProduct)
        builder.method = .POST
        XCTAssertEqual(builder.method.rawValue, "POST")
        XCTAssertEqual(builder.getUrl(), URL(string: "https://api.mercadolibre.com/products/search"))
    }
}
