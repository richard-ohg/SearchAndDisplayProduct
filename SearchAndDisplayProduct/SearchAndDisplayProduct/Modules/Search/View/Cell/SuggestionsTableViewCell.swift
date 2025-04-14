//
//  SuggestionsTableViewCell.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//

import UIKit

class SuggestionsTableViewCell: UITableViewCell {

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "clock")
        imageView.tintColor = .black
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "PruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPruebaPrueba"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    lazy var removeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.configuration = .filled()
        button.configuration?.image = UIImage(systemName: "xmark")
        button.configuration?.imagePlacement = .all
        button.configuration?.baseBackgroundColor = .clear
        button.configuration?.baseForegroundColor = .black
        button.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        selectionStyle = .none
        addSubviews()
        addConstraints()
    }

    private func addSubviews() {
        contentView.add(subviews:
                iconImageView,
                titleLabel,
                removeButton)
    }

    private func addConstraints() {
        iconImageView
            .pin(.height, .width, constant: 30)
            .pin(.leading, to: contentView.leadingAnchor, offset: 10)
            .pin(.centerY, to: titleLabel)

        titleLabel
            .pin(.leading, to: iconImageView.trailingAnchor, offset: 10)
            .pin(.top, to: contentView.topAnchor, offset: 10)
            .pin(.bottom, to: contentView.bottomAnchor, offset: -10)

        removeButton
            .pin(.height, .width, constant: 30)
            .pin(.leading, to: titleLabel.trailingAnchor, offset: 10)
            .pin(.trailing, to: contentView.trailingAnchor, offset: -10)
            .pin(.centerY, to: titleLabel)
    }

    @objc func removeButtonTapped() {
        print("tapped")
    }
}

extension SuggestionsTableViewCell: Reusable {}
