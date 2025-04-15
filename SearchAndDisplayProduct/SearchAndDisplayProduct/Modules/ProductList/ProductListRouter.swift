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
	
    static func createModule(searchText: String) -> UIViewController {
        
        let view = ProductListViewController()
        let presenter = ProductListPresenter()
        let interactor = ProductListInteractor()
        let router = ProductListRouter()
        
        view.presenter = presenter
        view.searchText = searchText
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension ProductListRouter: ProductList_PresenterToRouterProtocol {
    func goToProductDetail(productId: String) {
        let nextView = ProductDetailRouter.createModule(productId: productId)
        viewController?.navigationController?.pushViewController(nextView, animated: true)
    }
}
