//
//  ProductListView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

protocol ProductListViewDelegate: AnyObject {
}

final class ProductListView: UIView {

    weak var delegate: (ProductListViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource)?

    lazy var productsCollectionView: ProductListCollectionView = {
        let collectionView = ProductListCollectionView()
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        return collectionView
    }()

    lazy var emptyState: EmptyStateView = {
        let view = EmptyStateView()
        view.isHidden = true
        return view
    }()

    init(delegate: ProductListViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource) {
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
        backgroundColor = Colors.collectionBackgroundColor
        addSubviews()
        addConstraints()
        addGradient()
    }

    private func addSubviews() {
        add(subviews:
                productsCollectionView,
                emptyState)
    }

    private func addConstraints() {
        productsCollectionView
            .pin(.top, to: layoutMarginsGuide.topAnchor)
            .pin(.leading, to: leadingAnchor)
            .pin(.trailing, to: trailingAnchor)
            .pin(.bottom, to: layoutMarginsGuide.bottomAnchor)

        emptyState.pinEdges(to: self)
    }

    func reload() {
        productsCollectionView.reloadData()
    }

    func showEmptyState() {
        productsCollectionView.isHidden = true
        emptyState.isHidden = false
    }
}

extension ProductListView: BackgroundGradientProtocol {}
