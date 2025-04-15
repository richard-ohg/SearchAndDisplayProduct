//
//  GalleryCollectionViewCell.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.add(subviews: productImage)

        productImage
            .pinEdges(to: contentView)
    }

    func setupImage(_ image: UIImage?){
        guard let image = image else { return }
        self.productImage.image = image
    }
}

extension GalleryCollectionViewCell: Reusable {}
