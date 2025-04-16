//
//  LabelView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

class LabelView: UIView {

    lazy var labelView: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
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
        add(subviews: labelView)

        labelView
            .pin(.top, to: topAnchor, offset: 5)
            .pin(.leading, to: leadingAnchor, offset: 15)
            .pin(.trailing, to: trailingAnchor, offset: -15)
            .pin(.bottom, to: bottomAnchor, offset: 5)
    }

    func configure(text: String) {
        labelView.text = text
    }
}
