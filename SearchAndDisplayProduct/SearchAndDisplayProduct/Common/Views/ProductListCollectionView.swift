//
//  ProductListCollectionView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

class ProductListCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (ViewValues.widthScreen - ViewValues.doubleCollectionPadding - ViewValues.lineSpacingCollectionView) / ViewValues.multiplierTwo
        layout.itemSize = CGSize(width: itemWidth, height: ViewValues.productItemHeight)
        layout.minimumLineSpacing = ViewValues.lineSpacingCollectionView
        layout.minimumInteritemSpacing = ViewValues.lineSpacingCollectionView
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: ViewValues.normalCollectionPadding,
            bottom: .zero,
            right: ViewValues.normalCollectionPadding
        )
        super.init(frame: .zero, collectionViewLayout: layout)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func config() {
        register(ProductListViewCell.self, forCellWithReuseIdentifier: ProductListViewCell.reuseIdentifier)
        backgroundColor = Colors.collectionBackgroundColor
    }
}
