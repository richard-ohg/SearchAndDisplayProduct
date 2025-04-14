//
//  SearchViewController+TableView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionsTableViewCell.reuseIdentifier, for: indexPath) as? SuggestionsTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {}
