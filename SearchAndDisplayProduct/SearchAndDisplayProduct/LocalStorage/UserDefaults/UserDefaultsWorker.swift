//
//  UserDefaultsWorker.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

struct UserDefaultsWorker {

    static func addNewSerch(item: String) -> [String] {
        UserDefaults.searches.append(item)
        return UserDefaults.searches
    }

    static func removeSearch(item: String) -> [String] {
        if let index = UserDefaults.searches.lastIndex(of: item) {
            UserDefaults.searches.remove(at: index)
        }
        return UserDefaults.searches
    }

    static func getSearches() -> [String] {
        return UserDefaults.searches
    }
}
