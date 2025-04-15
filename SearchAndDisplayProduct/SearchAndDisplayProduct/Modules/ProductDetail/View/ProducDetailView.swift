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
    
    lazy var galleryCollectionView: GalleryCarruselView = {
        let collection = GalleryCarruselView()
        return collection
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
        backgroundColor = Colors.collectionBackgroundColor
        addSubviews()
        addConstraints()
        addGradient()
    }
    
    private func addSubviews() {
        add(subviews: galleryCollectionView)
    }
    
    private func addConstraints() {
        galleryCollectionView
            .pin(.top, to: layoutMarginsGuide.topAnchor)
            .pin(.leading, to: leadingAnchor)
            .pin(.trailing, to: trailingAnchor)
            .pin(.height, constant: 346)
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
