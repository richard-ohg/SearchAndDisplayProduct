//
//  RequesManager.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

class RequestManager {
    private let apiClient: ApiClientServiceProtocol
    static let shared: RequestManager = RequestManager()

    private init(
        apiClient: ApiClientServiceProtocol = ApiClientService())
    {
        self.apiClient = apiClient
    }

    func fetchProducts(searchTerm: String) async -> Result<SearchProductsResponse, Error> {
        do {
            var builder = URLBuilder()
            let queryParams: [String: Any] = ["status": "active", "site_id": "MLM", "q": searchTerm]
            builder.config(path: .searchProduct, queryParams: queryParams)
            let apiClientResult = try await apiClient.fetch(url: builder.getUrl(), type: SearchProductsResponse.self)
            return .success(apiClientResult)
        } catch {
            return .failure(error)
        }
    }
}
