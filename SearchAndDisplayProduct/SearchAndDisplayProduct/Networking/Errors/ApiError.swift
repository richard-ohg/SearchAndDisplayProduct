//
//  ApiError.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import Foundation

enum ApiError: Error {
    case clientError
    case serverError
    case unknownError
    case errorInUrl
    case decodingError
}

extension ApiError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .clientError:
            return NSLocalizedString("Cliente error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "")
        case .errorInUrl:
            return NSLocalizedString("Error in URL", comment: "")
        case .decodingError:
            return NSLocalizedString("Error Decoding", comment: "")
        }
    }
}
