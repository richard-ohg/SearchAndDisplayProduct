//
//  SearchView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
}

final class SearchView: UIView {

    weak var delegate: (SearchViewDelegate & UITableViewDelegate & UITableViewDataSource)?

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barStyle = .black
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.searchTextField.textColor = .white
        return searchBar
    }()

    lazy var suggestionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SuggestionsTableViewCell.self, forCellReuseIdentifier: SuggestionsTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = delegate
        tableView.dataSource = delegate
        return tableView
    }()

    init(delegate: SearchViewDelegate & UITableViewDelegate & UITableViewDataSource) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubviews()
        addConstraints()
        backgroundColor = .white
        addGradient()
    }

    private func addSubviews() {
        add(subviews:
                suggestionsTableView)
    }

    private func addConstraints() {
        suggestionsTableView
            .pinEdges(to: layoutMarginsGuide)
    }

    private func addGradient() {
        layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 90)
        gradientLayer.colors = [UIColor.getColorWith(hex: "#98f3f5").cgColor, UIColor.white.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
