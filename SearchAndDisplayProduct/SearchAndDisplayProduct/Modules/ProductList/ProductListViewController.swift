//
//  ProductListViewController.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//  
//

import UIKit

class ProductListViewController: UIViewController {

    var presenter: ProductList_ViewToPresenterProtocol?
    var searchText: String?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = searchText
        view.backgroundColor = .white
        guard let searchText = searchText else { return }
        showSpinner()
        presenter?.fetchProductList(searchTerm: searchText)
    }
}

extension ProductListViewController: SpinnerDisplayable {}
extension ProductListViewController: MessageDisplayable {}

// MARK: - P R E S E N T E R · T O · V I E W
extension ProductListViewController: ProductList_PresenterToViewProtocol {

    func displayProductList(viewModel: [ProductListViewModel]) {
        DispatchQueue.main.async {
            self.hideSpinner()
            print(viewModel)
        }
    }

    func showError(error: Error) {
        presentSimpleAlert(title: AppLocalized.errorTitle, message: error.localizedDescription)
    }
}
