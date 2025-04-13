//
//  Path.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

enum Path {
    case custom(String)
    case empty
    case searchProduct
    
    func getString() -> String {
        switch self {
        case .custom(let path):
            return path
        case .empty:
            return "/"
        case .searchProduct:
            return "/products/search"
        }
    }
}
