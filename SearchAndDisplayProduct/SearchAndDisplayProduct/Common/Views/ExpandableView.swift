//
//  ExpandableView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

protocol ExpandableViewDelegate: AnyObject {
    func tapped(isOpen: Bool, view: ExpandableView)
}

public class ExpandableView: UIView {

    weak var delegate: ExpandableViewDelegate?

    // MARK: - Properties
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = ViewValues.spaceStackExpandableView
        stack.axis = .vertical
        return stack
    }()

    private lazy var titleView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.titleExpandableViewFontSize)
        label.textColor = Colors.defaultLabel
        label.numberOfLines = ViewValues.numberLinesTitleExpandableView
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    private lazy var dropdownImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.dropDrownImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var dropdownButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(dropdownButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    public var contentView: UIView?

    public var isOpen: Bool = false {
        didSet {
            let image = isOpen ? Images.chevronUp : Images.chevronDown
            dropdownImage.image = UIImage(named: image)
            contentView?.isHidden = !isOpen
        }
    }

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup
    private func setup() {
        self.backgroundColor = Colors.backgroundExpandableView
        titleLabel.backgroundColor = Colors.backgroundExpandableView

        addSubviews()
        addConstraints()
    }

    private func addSubviews() {
        titleView.add(subviews: titleLabel, dropdownImage, dropdownButton)
        contentStack.addArrangedSubview(titleView)
        add(subviews: contentStack)
    }

    private func addConstraints() {
        contentStack
            .pin(.top, .leading, .trailing, .bottom, to: self)

        titleLabel
            .pin(.top, .leading, .bottom, to: titleView)
            .pin(.height, relation: .greaterThanOrEqual, constant: ViewValues.titleHeightExpandableView)

        dropdownImage
            .pin(.trailing, to: titleView.trailingAnchor)
            .pin(.leading, to: titleLabel.trailingAnchor, offset: ViewValues.leadingImageExpandableView)
            .pin(.centerY, to: titleView.centerYAnchor)
            .pin(.width, .height, constant: ViewValues.imageHeightWidthExpandableView)

        dropdownButton
            .pin(.top, .trailing, .leading, .bottom, to: titleView)
    }

    // MARK: - Configuration
    public func configure(
        title: String,
        isOpen: Bool,
        content: UIView
    ) {
        titleLabel.text = title

        self.contentView = content
        if let contentView = self.contentView {
            contentStack.addArrangedSubview(contentView)
        }

        self.isOpen = isOpen
    }

    @objc private func dropdownButtonTapped(_ sender: UIButton) {
        isOpen = !isOpen
        delegate?.tapped(isOpen: isOpen, view: self)
    }
}
