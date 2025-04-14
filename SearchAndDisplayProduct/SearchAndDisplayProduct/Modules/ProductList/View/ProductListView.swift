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

    weak var delegate: ProductListViewDelegate?

    init(delegate: ProductListViewDelegate) {
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
    }

    private func addConstraints() {

    }

}

extension ProductListView: BackgroundGradientProtocol {}
