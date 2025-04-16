//
//  ProductDetailHeader.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

class ProductDetailHeader: UIView {

    lazy var viewHeaderSection: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.axis = .vertical
        view.spacing = 4
        return view
    }()

    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = Colors.defaultLabel
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.productNameHeaderFontSize)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    lazy var idProductLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabel
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.labelIdHeaderFontSize)
        return label
    }()

    lazy var sellerLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabel
        return label
    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setup() {
        addSubviews()
        addConstraints()
    }

    private func addSubviews() {
        addSubview(viewHeaderSection)
        viewHeaderSection.addSuviews(productNameLabel, idProductLabel, sellerLabel)
    }

    private func addConstraints() {
        viewHeaderSection
            .pin(.top, .bottom, to: self)
            .pin(.leading, to: self, constant: 16)
            .pin(.trailing, to: self, constant: -16)

        idProductLabel
            .pin(.height, constant: 21)

        sellerLabel
            .pin(.height, constant: 21)
    }

    func configure(
        name: String,
        productId: String,
        sellerName: String
    ) {
        DispatchQueue.main.async {
            self.productNameLabel.text = name
            self.idProductLabel.text = "Código del producto: \(productId)"
            self.createSellerName(sellerName: sellerName)
        }
    }

    private func createSellerName(sellerName: String) {
        let seller = "Vendido por ".attributed(with: .systemFont(ofSize: ViewValues.sellerHeaderFontSize))
        let sellerName = sellerName.attributed(with: .boldSystemFont(ofSize: ViewValues.sellerHeaderFontSize))
        sellerLabel.attributedText = seller.concatenated(with: sellerName)
    }
}
