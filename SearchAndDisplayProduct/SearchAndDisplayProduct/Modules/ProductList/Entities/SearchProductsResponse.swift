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
    let dateCreated: Date
    let catalogProductID: String
    let status: Status
    let domainID: DomainID
    let settings: Settings
    let name: String
    let attributes: [Attribute]
    let pictures: [Picture]
    let qualityType: QualityType
    let priority: Priority
    let type: TypeEnum
    let siteID: SiteID
    let keywords, description: String

    enum CodingKeys: String, CodingKey {
        case id
        case dateCreated = "date_created"
        case catalogProductID = "catalog_product_id"
        case status
        case domainID = "domain_id"
        case settings, name
        case attributes, pictures
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

enum DomainID: String, Codable {
    case mlmCellphones = "MLM-CELLPHONES"
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
}

enum Priority: String, Codable {
    case medium = "MEDIUM"
}

enum QualityType: String, Codable {
    case primitive = "PRIMITIVE"
}

// MARK: - Settings
struct Settings: Codable {
    let listingStrategy: ListingStrategy
    let exclusive: Bool

    enum CodingKeys: String, CodingKey {
        case listingStrategy = "listing_strategy"
        case exclusive
    }
}

enum ListingStrategy: String, Codable {
    case catalogRequired = "catalog_required"
}

enum SiteID: String, Codable {
    case mlm = "MLM"
}

enum Status: String, Codable {
    case active = "active"
}

enum TypeEnum: String, Codable {
    case product = "PRODUCT"
}
