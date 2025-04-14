//
//  SearchViewController+UISearchBarDelegate.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, text.count > 2 else { return }
        searchBar.resignFirstResponder()
        searchBar.text = ""
        presenter?.addNewSearch(text: text)
        presenter?.goToProductList(searchText: text)
    }
}
