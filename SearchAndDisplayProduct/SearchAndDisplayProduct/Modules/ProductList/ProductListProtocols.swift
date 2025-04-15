//
//  ProductListProtocols.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//  
//

import Foundation

// MARK: VIEW -> PRESENTER
protocol ProductList_ViewToPresenterProtocol: AnyObject {
	var view: ProductList_PresenterToViewProtocol? { get set }
	var interactor: ProductList_PresenterToInteractorProtocol? { get set }
	var router: ProductList_PresenterToRouterProtocol? { get set }

    func fetchProductList(searchTerm: String)
    func getItem(with: Int) -> ProductListViewModel
    func getItemsCount() -> Int
}

// MARK: PRESENTER -> INTERACTOR
protocol ProductList_PresenterToInteractorProtocol: AnyObject {
    var presenter: ProductList_InteractorToPresenterProtocol? { get set }

    func fetchProductList(searchTerm: String)
}

// MARK: INTERACTOR -> PRESENTER
protocol ProductList_InteractorToPresenterProtocol: AnyObject {

    func presentProductList(response: SearchProductsResponse)
    func showError(error: Error)
}

// MARK: PRESENTER -> VIEW
protocol ProductList_PresenterToViewProtocol: AnyObject {
    var presenter: ProductList_ViewToPresenterProtocol? { get set }

    func displayProductList()
    func showError(error: Error)
    func showEmptyState()
}

// MARK: PRESENTER -> ROUTER
protocol ProductList_PresenterToRouterProtocol: AnyObject {
}
