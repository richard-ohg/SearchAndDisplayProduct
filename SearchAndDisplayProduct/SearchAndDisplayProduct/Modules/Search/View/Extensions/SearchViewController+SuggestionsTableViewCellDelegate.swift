//
//  SearchViewController+SuggestionsTableViewCellDelegate.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

extension SearchViewController: SuggestionsTableViewCellDelegate {
    func removeButtonTapped(index: Int) {
        let text = suggestedSearches[index]
        presenter?.removeSearch(text: text)
    }
}
