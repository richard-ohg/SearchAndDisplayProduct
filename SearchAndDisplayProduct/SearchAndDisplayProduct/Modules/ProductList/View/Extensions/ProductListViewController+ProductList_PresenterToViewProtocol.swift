//
//  ProductListViewController+ProductList_PresenterToViewProtocol.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

// MARK: - P R E S E N T E R · T O · V I E W
extension ProductListViewController: ProductList_PresenterToViewProtocol {

    func displayProductList() {
        DispatchQueue.main.async {
            self.hideSpinner()
            self.productListView.reload()
        }
    }

    func showError(error: Error) {
        DispatchQueue.main.async {
            self.hideSpinner()
            self.presentSimpleAlert(title: AppLocalized.errorTitle, message: error.localizedDescription)
        }
    }

    func showEmptyState() {
        DispatchQueue.main.async {
            self.hideSpinner()
            self.productListView.showEmptyState()
        }
    }
}
