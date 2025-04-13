//
//  ContentMode.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

enum ContentMode {
    case jsonApp

    func contentType() -> String {
        switch self {
        case .jsonApp:
            return "application/json"
        }
    }
    
    func accessToken(token: String) -> String {
        switch self {
        case .jsonApp:
            return "Bearer \(token)"
        }
    }
}
