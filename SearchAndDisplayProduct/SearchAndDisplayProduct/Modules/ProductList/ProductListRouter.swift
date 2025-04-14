//
//  ProductListRouter.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//  
//

import UIKit

class ProductListRouter {
    
    weak var viewController: UIViewController?
	
    static func createModule() -> UIViewController {
        
        let view = ProductListViewController()
        let presenter = ProductListPresenter()
        let interactor = ProductListInteractor()
        let router = ProductListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension ProductListRouter: ProductList_PresenterToRouterProtocol {
    
}
