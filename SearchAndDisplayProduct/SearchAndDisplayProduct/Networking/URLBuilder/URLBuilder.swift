//
//  URLBuilder.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import Foundation

struct URLBuilder {
    private static let baseUrlDefault = "https://api.mercadolibre.com"
    private static let accessToken = "APP_USR-3049701471491883-041318-fae0e325e73b02b258b2da3ba4c80f89-793488646"
    
    let urlComponents: URLComponents?
    var scheme: String = "https"
    var method: Method = .GET
    var path: Path = .empty
    var queryParams: [String: Any] = [:]
    var body: Data?
    var headers: [String: String]?
    var contentMode: ContentMode = .jsonApp
    
    init(baseUrl: String = URLBuilder.baseUrlDefault) {
        self.urlComponents = URLComponents(string: baseUrl)
    }
    
    mutating func config(
        scheme: String = "https",
        method: Method = .GET,
        path: Path = .empty,
        queryParams: [String: Any] = [:])
    {
        self.scheme = scheme
        self.method = method
        self.path = path
        self.queryParams = queryParams
    }
    
    func getUrl() -> URL? {
        var components = self.urlComponents
        components?.scheme = scheme
        components?.path = path.getString()
        components?.queryItems = buildQuery()
        return components?.url
    }
    
    func getUrlRequest() -> URLRequest? {
        guard let url = getUrl() else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue(contentMode.contentType(), forHTTPHeaderField: "Content-Type")
        request.addValue(contentMode.accessToken(token: URLBuilder.accessToken), forHTTPHeaderField: "Authorization")
        if let headers = self.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
    private func buildQuery() -> [URLQueryItem]? {
        var query: [URLQueryItem] = []
        queryParams.forEach { (key: String, value: Any) in
            query.append(URLQueryItem(name: key, value: String(describing: value)))
        }
        return query.isEmpty ? nil : query
    }
}
