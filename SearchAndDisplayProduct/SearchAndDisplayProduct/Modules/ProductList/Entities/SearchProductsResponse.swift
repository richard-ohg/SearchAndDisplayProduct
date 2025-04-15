//
//  SearchProductsResponse.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

struct SearchProductsResponse: Decodable {
    var paging: Paging
    var results: [Product]

    enum CodingKeys: String, CodingKey {
        case paging, results
    }
}

struct Paging: Decodable {
    let total, limit, offset: Int

    enum CodingKeys: CodingKey {
        case total
        case limit
        case offset
    }
}

struct Product: Decodable {
    let id: String
    let dateCreated: String
    let catalogProductID: String
    let status: String
    let domainID: String
    let settings: Settings
    let name: String
    let attributes: [Attribute]
    let pictures: [Picture]
    let parentID: String?
    let qualityType: String
    let priority: String
    let type: String
    let siteID: String
    let keywords, description: String

    enum CodingKeys: String, CodingKey {
        case id
        case dateCreated = "date_created"
        case catalogProductID = "catalog_product_id"
        case status
        case domainID = "domain_id"
        case settings, name
        case attributes, pictures
        case parentID = "parent_id"
        case qualityType = "quality_type"
        case priority, type
        case siteID = "site_id"
        case keywords, description
    }
}

// MARK: - Attribute
struct Attribute: Codable {
    let id, name: String
    let valueID: String?
    let valueName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
}

// MARK: - Settings
struct Settings: Codable {
    let listingStrategy: String
    let exclusive: Bool

    enum CodingKeys: String, CodingKey {
        case listingStrategy = "listing_strategy"
        case exclusive
    }
}
