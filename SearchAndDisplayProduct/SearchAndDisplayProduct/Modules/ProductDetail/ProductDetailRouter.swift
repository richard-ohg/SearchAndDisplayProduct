//
//  ProductDetailRouter.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//  
//

import UIKit

class ProductDetailRouter {
	
    static func createModule() -> UIViewController {
        
        let view = ProductDetailViewController()
        let presenter = ProductDetailPresenter()
        let interactor = ProductDetailInteractor()
        let router = ProductDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension ProductDetailRouter: ProductDetail_PresenterToRouterProtocol {
    
}
