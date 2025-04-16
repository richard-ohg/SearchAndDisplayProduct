//
//  ProducDetailView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit
import Kingfisher

protocol ProductDetailViewDelegate: AnyObject {}

final class ProductDetailView: UIView {
    
    weak var delegate: ProductDetailViewDelegate?

    enum TagIdentifier: Int {
        case description = 1
        case specs
    }

    lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        return view
    }()

    lazy var productDetailHeader: ProductDetailHeader = {
        let view = ProductDetailHeader()
        return view
    }()

    lazy var galleryCollectionView: GalleryCarruselView = {
        let collection = GalleryCarruselView()
        return collection
    }()

    lazy var descriptionContainer: ExpandableView = {
        let view = ExpandableView()
        view.tag = TagIdentifier.description.rawValue
        view.delegate = self
        return view
    }()

    lazy var descriptionView: LabelView = {
        let view = LabelView()
        return view
    }()

    lazy var specsContainer: ExpandableView = {
        let view = ExpandableView()
        view.tag = TagIdentifier.specs.rawValue
        view.delegate = self
        return view
    }()

    lazy var specsView: LabelView = {
        let view = LabelView()
        return view
    }()

    lazy var addToCartContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
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

    init(delegate: ProductDetailViewDelegate) {
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
        addSubview(mainView)
        addSubview(addToCartContainer)
        mainView.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(mainStackView)
        mainStackView.addSuviews(productDetailHeader,galleryCollectionView, descriptionContainer, specsContainer)
        addToCartContainer.addSubview(addToCartButton)
    }

    private func addConstraints() {
        mainView
            .pin(.top, to: layoutMarginsGuide.topAnchor)
            .pin(.leading, .trailing, to: self)

        scrollView
            .pinEdges(to: mainView)

        containerView
            .pinEdges(to: scrollView)
            .pin(.height, to: mainView, priority: .defaultLow)
            .pin(.width, to: mainView, relation: .equal)

        mainStackView
            .pinEdges(to: containerView)

        galleryCollectionView
            .pin(.height, constant: ViewValues.galleryCollectionwHeight)
            .pin(.width, to: mainStackView, relation: .equal)

        descriptionContainer
            .pin(.leading, to: mainStackView.leadingAnchor, offset: ViewValues.descriptionContainerPadding)
            .pin(.trailing, to: mainStackView.trailingAnchor, offset: -ViewValues.descriptionContainerPadding)

        specsContainer
            .pin(.leading, to: mainStackView.leadingAnchor, offset: ViewValues.specsContainerPadding)
            .pin(.trailing, to: mainStackView.trailingAnchor, offset: -ViewValues.specsContainerPadding)

        addToCartContainer
            .pin(.top, to: mainView.bottomAnchor)
            .pin(.bottom, to: layoutMarginsGuide.bottomAnchor)
            .pin(.leading, to: leadingAnchor)
            .pin(.trailing, to: trailingAnchor)
            .pin(.height, constant: ViewValues.addToCartContainerHeight)

        addToCartButton
            .pin(.height, constant: ViewValues.addToCartButtonHeight)
            .pin(.leading, to: addToCartContainer.leadingAnchor, offset: ViewValues.addToCartButtonPadding)
            .pin(.trailing, to: addToCartContainer.trailingAnchor, offset: -ViewValues.addToCartButtonPadding)
            .pin(.centerY, to: addToCartContainer.centerYAnchor)
    }

    func configure() {
        productDetailHeader.configure(name: "Zapatilla Nike Big Nike Low Hombre Color Negro", productId: "MLM47165752", sellerName: "Mercado Libre")
        descriptionView.configure(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta vestibulum erat, a dapibus dolor placerat sit amet. Sed hendrerit dui non nibh commodo, id efficitur justo tempus. Sed lorem nibh, cursus vitae consequat ac, mollis tristique erat. Nunc quam urna, faucibus in est at, interdum facilisis orci. Curabitur porta posuere purus, id auctor felis feugiat vitae. Maecenas scelerisque tempus magna. Phasellus at quam vel justo dapibus pharetra eget ac mauris. Maecenas tellus justo, sagittis nec convallis sit amet, vestibulum eget erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed consequat condimentum nisi, a pulvinar tellus malesuada in. Nullam id turpis elit. Integer a aliquet dolor, et venenatis leo. Sed vitae mattis orci. Nulla elit risus, tempus non vestibulum in, facilisis sed tortor.")
        descriptionContainer.configure(title: "Description", isOpen: false, content: descriptionView)
        specsView.configure(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta vestibulum erat, a dapibus dolor placerat sit amet. Sed hendrerit dui non nibh commodo, id efficitur justo tempus. Sed lorem nibh, cursus vitae consequat ac, mollis tristique erat. Nunc quam urna, faucibus in est at, interdum facilisis orci.")
        specsContainer.configure(title: "Especificaciones", isOpen: true, content: specsView)
        setImages()
    }

    func setImages() {
        let imagesString = ["https://http2.mlstatic.com/D_NQ_NP_955830-MLA82798500814_032025-F.jpg", "https://http2.mlstatic.com/D_NQ_NP_745899-MLA82798554710_032025-F.jpg", "https://http2.mlstatic.com/D_NQ_NP_743087-MLA82798518516_032025-F.jpg","https://http2.mlstatic.com/D_NQ_NP_861199-MLA82798554732_032025-F.jpg","https://http2.mlstatic.com/D_NQ_NP_852119-MLA82798536416_032025-F.jpg"]

        Utils.getImagesFromUrlString(urlStrings: imagesString) { [weak self] images in
            let imagesToShow: [UIImage] = images.isEmpty ? [UIImage(named: "noDisponible") ?? UIImage()] : images
            self?.galleryCollectionView.updateCarrousel(images: imagesToShow)
        }
    }
}

extension ProductDetailView: BackgroundGradientProtocol {}
