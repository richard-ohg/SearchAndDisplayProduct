//
//  SearchViewController.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//  
//

import UIKit

class SearchViewController: UIViewController {

    var presenter: Search_ViewToPresenterProtocol?
    var suggestedSearches: [String] = []

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()

    lazy var searchView = {
        return SearchView(delegate: self)
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBar()
        self.view = searchView
        presenter?.fetchSuggestedSearches()
    }

    private func setSearchBar() {
        setupClearNavBar()
        let navBar = self.navigationController?.navigationBar
        navBar?.topItem?.hidesBackButton = true
        navBar?.topItem?.titleView = searchBar
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension SearchViewController: Search_PresenterToViewProtocol {

    func displaySuggestedSearches(searches: [String]) {
        suggestedSearches = searches
        searchView.reloadTable()
    }
}
