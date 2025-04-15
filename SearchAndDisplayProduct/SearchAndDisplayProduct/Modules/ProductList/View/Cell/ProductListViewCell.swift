//
//  ProductListViewCell.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit
import Kingfisher

final class ProductListViewCell: UICollectionViewCell {
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.setCornerRadius(withValue: ViewValues.imageCornerRadius)
        return imageView
    }()

    lazy var nameProductLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabel
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.productNameFontSize)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    lazy var priceTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabel
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.pricePlaceholderFontSize)
        label.text = AppLocalized.priceTitle
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.priceFontSize)
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    lazy var priceWithoutDiscountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewValues.priceWithouDiscountFontSize)
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    lazy var shippingLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.shippingText
        label.font = UIFont.systemFont(ofSize: ViewValues.shippingLabelFontSize)
        label.textAlignment = .left
        label.text = AppLocalized.shipping
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle(AppLocalized.addToCartButton, for: .normal)
        button.setTitleColor(Colors.addToCartTextButton, for: .normal)
        button.backgroundColor = Colors.addToCartBackgroundButton
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: ViewValues.addToCartButtonFontSize)
        button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        button.setCornerRadius(withValue: ViewValues.addToCartButtonCornerRadius)
        return button
    }()

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    private func configUI() {
        contentView.backgroundColor = Colors.collectionCellBackgroundColor
        setCornerRadius(withValue: ViewValues.cornerRadiusCell)
        contentView.add(subviews:
                            productImageView,
                            nameProductLabel,
                            priceTitleLabel,
                            priceLabel,
                            priceWithoutDiscountLabel,
                            shippingLabel,
                            addToCartButton)

        productImageView
            .pin(.top, to: contentView.topAnchor, offset: ViewValues.paddingCell)
            .pin(.leading, to: contentView.leadingAnchor, offset: ViewValues.paddingCell)
            .pin(.trailing, to: contentView.trailingAnchor, offset: -ViewValues.paddingCell)
            .pin(.height, constant: ViewValues.productImageHeight)

        nameProductLabel
            .pin(.top, to: productImageView.bottomAnchor, offset: ViewValues.nameProductLabelTop)
            .pin(.leading, to: contentView.leadingAnchor, offset: ViewValues.paddingCell)
            .pin(.trailing, to: contentView.trailingAnchor, offset: -ViewValues.paddingCell)

        priceTitleLabel
            .pin(.top, to: nameProductLabel.bottomAnchor, offset: ViewValues.priceTitleLabelTop)
            .pin(.leading, to: contentView.leadingAnchor, offset: ViewValues.paddingCell)
            .pin(.trailing, to: contentView.trailingAnchor, offset: -ViewValues.paddingCell)

        priceLabel
            .pin(.top, to: priceTitleLabel.bottomAnchor, offset: ViewValues.priceLabelsTop)
            .pin(.leading, to: contentView.leadingAnchor, offset: ViewValues.paddingCell)

        priceWithoutDiscountLabel
            .pin(.top, to: priceTitleLabel.bottomAnchor, offset: ViewValues.priceLabelsTop)
            .pin(.leading, to: priceLabel.trailingAnchor, offset: ViewValues.paddingCell)
            .pin(.trailing, to: contentView.trailingAnchor, offset: -ViewValues.paddingCell)
            .pin(.bottom, to: priceLabel.bottomAnchor)

        shippingLabel
            .pin(.top, to: priceLabel.bottomAnchor, offset: ViewValues.shippingLabelTop)
            .pin(.leading, to: contentView.leadingAnchor, offset: ViewValues.paddingCell)
            .pin(.trailing, to: contentView.trailingAnchor, offset: -ViewValues.paddingCell)

        addToCartButton
            .pin(.top, to: shippingLabel.bottomAnchor, offset: ViewValues.addToCartButtonTop, priority: .defaultLow)
            .pin(.leading, to: contentView.leadingAnchor, offset: ViewValues.paddingCell)
            .pin(.trailing, to: contentView.trailingAnchor, offset: -ViewValues.paddingCell)
            .pin(.bottom, to: contentView.bottomAnchor, offset: -ViewValues.paddingCell, priority: .defaultHigh)
    }

    func configData(itemData: ProductListViewModel) {
        productImageView.kf.setImage(with: itemData.imageURL, placeholder: UIImage(named: Images.placeholder))
        nameProductLabel.text = itemData.name
        configurePrice(price: 50, priceWithoutDiscount: 100)
    }

    func configurePrice(price: Double, priceWithoutDiscount: Double) {
        if price < priceWithoutDiscount {
            let attributedString = NSMutableAttributedString(string: "$\(Utils.formatPrice(priceWithoutDiscount))")
            attributedString.addAttribute(
                .strikethroughStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: attributedString.length)
            )

            priceLabel.text = "$\(Utils.formatPrice(price))"
            priceLabel.textColor = Colors.priceWithDiscount

            priceWithoutDiscountLabel.attributedText = attributedString
            priceWithoutDiscountLabel.isHidden = false
        } else {
            priceWithoutDiscountLabel.isHidden = true
            priceLabel.text = "$\(Utils.formatPrice(price))"
            priceLabel.textColor = Colors.defaultLabel
        }
    }
}

// MARK: - Extensions Here
extension ProductListViewCell: Reusable {}
