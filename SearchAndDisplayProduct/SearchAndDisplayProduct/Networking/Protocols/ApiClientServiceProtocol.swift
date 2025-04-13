//
//  ApiClientServiceProtocol.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import Foundation

protocol ApiClientServiceProtocol {
    func fetch<T: Decodable>(url: URL?, type: T.Type) async throws -> T
    func fetch<T: Decodable>(url: URLRequest?, type: T.Type) async throws -> T
}
