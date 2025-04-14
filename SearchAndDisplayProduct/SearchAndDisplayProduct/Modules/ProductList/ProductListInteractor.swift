//
//  ProductListInteractor.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//  
//

import Foundation

class ProductListInteractor: ProductList_PresenterToInteractorProtocol {
    weak var presenter: ProductList_InteractorToPresenterProtocol?

    func fetchProductList(searchTerm: String) {
        Task {
            let result = await RequestManager.shared.fetchProducts(searchTerm: searchTerm)
            switch result {
            case .success(let response):
                presenter?.presentProductList(response: response)
            case .failure(let error):
                presenter?.showError(error: error)
            }
        }
    }
}

