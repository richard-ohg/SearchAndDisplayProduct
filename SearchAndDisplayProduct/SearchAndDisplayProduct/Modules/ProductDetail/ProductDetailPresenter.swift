//
//  ProductDetailPresenter.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//  
//

import Foundation

class ProductDetailPresenter: ProductDetail_ViewToPresenterProtocol {
    
    weak var view: ProductDetail_PresenterToViewProtocol?
    var interactor: ProductDetail_PresenterToInteractorProtocol?
    var router: ProductDetail_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension ProductDetailPresenter: ProductDetail_InteractorToPresenterProtocol {

}
