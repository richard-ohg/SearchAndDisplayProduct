//
//  EmptyStateView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

class EmptyStateView: UIView {

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Images.emptySearch)
        image.contentMode = .scaleAspectFill
        image.setCornerRadius(withValue: 10)
        return image
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabel
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.emptyStateLabelSizeFont)
        label.text = AppLocalized.emptyState
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .clear
        addSubviews()
        addConstraints()
    }

    private func addSubviews() {
        add(subviews:
                imageView,
                label)
    }

    private func addConstraints() {
        imageView
            .pin(.height, constant: 250)
            .pin(.width, constant: 250)
            .pin(.centerX, to: centerXAnchor)
            .pin(.centerY, to: centerYAnchor, offset: -20)

        label
            .pin(.top, to: imageView.bottomAnchor, offset: 10)
            .pin(.leading, to: imageView.leadingAnchor)
            .pin(.trailing, to: imageView.trailingAnchor)
    }
}
