//
//  ProductListPresenter.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//  
//

import Foundation

class ProductListPresenter: ProductList_ViewToPresenterProtocol {
    
    weak var view: ProductList_PresenterToViewProtocol?
    var interactor: ProductList_PresenterToInteractorProtocol?
    var router: ProductList_PresenterToRouterProtocol?

    let mapper: ProductListMapper = ProductListMapper()
    var viewModel: [ProductListViewModel] = []

    func fetchProductList(searchTerm: String) {
        interactor?.fetchProductList(searchTerm: searchTerm)
    }

    func getItem(with index: Int) -> ProductListViewModel {
        return viewModel[index]
    }

    func getItemsCount() -> Int {
        return viewModel.count
    }

    func goToProductDetail(productId: String)  {
        router?.goToProductDetail(productId: productId)
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension ProductListPresenter: ProductList_InteractorToPresenterProtocol {

    func presentProductList(response: SearchProductsResponse) {
        guard response.results.isNotEmpty else {
            view?.showEmptyState()
            return
        }
        viewModel = response.results.map(mapper.map(entity:))
        view?.displayProductList()
    }

    func showError(error: Error) {
        view?.showError(error: error)
    }
}
