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
}

// MARK: PRESENTER -> INTERACTOR
protocol ProductList_PresenterToInteractorProtocol: AnyObject {
    var presenter: ProductList_InteractorToPresenterProtocol? { get set }
}

// MARK: INTERACTOR -> PRESENTER
protocol ProductList_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol ProductList_PresenterToViewProtocol: AnyObject {
    var presenter: ProductList_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol ProductList_PresenterToRouterProtocol: AnyObject {
}
