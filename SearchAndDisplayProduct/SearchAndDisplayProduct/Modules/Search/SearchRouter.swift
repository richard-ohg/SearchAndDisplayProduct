//
//  SearchRouter.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//  
//

import UIKit

class SearchRouter {

    weak var viewController: UIViewController?
	
    static func createModule() -> UIViewController {
        
        let view = SearchViewController()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        let router = SearchRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension SearchRouter: Search_PresenterToRouterProtocol {
    
}
