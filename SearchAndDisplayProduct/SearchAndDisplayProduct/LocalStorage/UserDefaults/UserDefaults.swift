//
//  UserDefaults.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

@propertyWrapper
struct UserDefault<Value: Codable> {
    let key: UserDefaults.Keys
    let defaultValue: Value
    var container: UserDefaults = .standard

    var wrappedValue: Value {
        get { return container.object(forKey: key.rawValue) as? Value ?? defaultValue }
        set { container.set(newValue, forKey: key.rawValue) }
    }
}

extension UserDefaults {
    enum Keys: String {
        case searches = "searchesKey"
    }

    @UserDefault(key: .searches, defaultValue: [])
    static var searches: [String]
}
