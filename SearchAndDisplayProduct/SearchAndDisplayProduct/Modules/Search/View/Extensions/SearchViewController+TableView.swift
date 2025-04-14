//
//  SearchViewController+TableView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestedSearches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionsTableViewCell.reuseIdentifier, for: indexPath) as? SuggestionsTableViewCell
        else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.configure(text: suggestedSearches[indexPath.row], index: indexPath.row)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = suggestedSearches[indexPath.row]
        presenter?.goToProductList(searchText: text)
    }
}
