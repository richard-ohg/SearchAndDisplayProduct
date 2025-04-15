//
//  ProductDetailProtocols.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//  
//

import Foundation

// MARK: VIEW -> PRESENTER
protocol ProductDetail_ViewToPresenterProtocol: AnyObject {
	var view: ProductDetail_PresenterToViewProtocol? { get set }
	var interactor: ProductDetail_PresenterToInteractorProtocol? { get set }
	var router: ProductDetail_PresenterToRouterProtocol? { get set }
}

// MARK: PRESENTER -> INTERACTOR
protocol ProductDetail_PresenterToInteractorProtocol: AnyObject {
    var presenter: ProductDetail_InteractorToPresenterProtocol? { get set }
}

// MARK: INTERACTOR -> PRESENTER
protocol ProductDetail_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol ProductDetail_PresenterToViewProtocol: AnyObject {
    var presenter: ProductDetail_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol ProductDetail_PresenterToRouterProtocol: AnyObject {
}
