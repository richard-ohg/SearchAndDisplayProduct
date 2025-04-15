//
//  ProductListViewController+CollectionView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return (presenter?.getItemsCount()).orZero
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductListViewCell.self.reuseIdentifier,
                for: indexPath) as? ProductListViewCell,
            let dataItem = presenter?.getItem(with: indexPath.row)
        else {
            return UICollectionViewCell()
        }
        cell.configData(itemData: dataItem)
        return cell
    }
}

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
    }
}
