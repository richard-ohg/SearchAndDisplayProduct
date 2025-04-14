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

    func fetchSuggestedSearches()
    func addNewSearch(text: String)
    func removeSearch(text: String)
}

// MARK: PRESENTER -> INTERACTOR
protocol Search_PresenterToInteractorProtocol: AnyObject {
    var presenter: Search_InteractorToPresenterProtocol? { get set }

    func fetchSuggestedSearches()
    func addNewSearch(text: String)
    func removeSearch(text: String)
}

// MARK: INTERACTOR -> PRESENTER
protocol Search_InteractorToPresenterProtocol: AnyObject {

    func presentSuggestedSearches(searches: [String])
}

// MARK: PRESENTER -> VIEW
protocol Search_PresenterToViewProtocol: AnyObject {
    var presenter: Search_ViewToPresenterProtocol? { get set }

    func displaySuggestedSearches(searches: [String])
}

// MARK: PRESENTER -> ROUTER
protocol Search_PresenterToRouterProtocol: AnyObject {
}
