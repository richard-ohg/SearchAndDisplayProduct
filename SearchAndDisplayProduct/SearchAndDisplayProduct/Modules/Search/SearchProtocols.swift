//
//  SearchProtocols.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//  
//

import Foundation

// MARK: VIEW -> PRESENTER
protocol Search_ViewToPresenterProtocol: AnyObject {
	var view: Search_PresenterToViewProtocol? { get set }
	var interactor: Search_PresenterToInteractorProtocol? { get set }
	var router: Search_PresenterToRouterProtocol? { get set }
}

// MARK: PRESENTER -> INTERACTOR
protocol Search_PresenterToInteractorProtocol: AnyObject {
    var presenter: Search_InteractorToPresenterProtocol? { get set }
}

// MARK: INTERACTOR -> PRESENTER
protocol Search_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol Search_PresenterToViewProtocol: AnyObject {
    var presenter: Search_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol Search_PresenterToRouterProtocol: AnyObject {
}
