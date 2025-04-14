//
//  SearchPresenter.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//  
//

import Foundation

class SearchPresenter: Search_ViewToPresenterProtocol {
    
    weak var view: Search_PresenterToViewProtocol?
    var interactor: Search_PresenterToInteractorProtocol?
    var router: Search_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension SearchPresenter: Search_InteractorToPresenterProtocol {

}
