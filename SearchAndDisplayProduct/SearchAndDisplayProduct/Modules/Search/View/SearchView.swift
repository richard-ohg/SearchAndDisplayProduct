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

    lazy var suggestionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SuggestionsTableViewCell.self, forCellReuseIdentifier: SuggestionsTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.separatorStyle = .none
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
        backgroundColor = .white
        addSubviews()
        addConstraints()
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

    func reloadTable() {
        DispatchQueue.main.async {
            self.suggestionsTableView.reloadData()
        }
    }
}

extension SearchView: BackgroundGradientProtocol {}
