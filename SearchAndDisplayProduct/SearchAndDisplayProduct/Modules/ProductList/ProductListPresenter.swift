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
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension ProductListPresenter: ProductList_InteractorToPresenterProtocol {

}
