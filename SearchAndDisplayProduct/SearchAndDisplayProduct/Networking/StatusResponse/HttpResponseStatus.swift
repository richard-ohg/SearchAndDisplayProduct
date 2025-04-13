//
//  HttpResponseStatus.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
