//
//  SearchInteractor.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//  
//

import Foundation

class SearchInteractor: Search_PresenterToInteractorProtocol {
    weak var presenter: Search_InteractorToPresenterProtocol?

    func fetchSuggestedSearches() {
        let suggestedSearches = UserDefaultsWorker.getSearches()
        presenter?.presentSuggestedSearches(searches: suggestedSearches)
    }

    func addNewSearch(text: String) {
        let suggestedSearches = UserDefaultsWorker.addNewSerch(item: text)
        presenter?.presentSuggestedSearches(searches: suggestedSearches)
    }

    func removeSearch(text: String) {
        let suggestedSearches = UserDefaultsWorker.removeSearch(item: text)
        presenter?.presentSuggestedSearches(searches: suggestedSearches)
    }
}

