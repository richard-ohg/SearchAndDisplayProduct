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

    lazy var productListView: ProductListView = {
        return ProductListView(delegate: self)
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = searchText
        view = productListView
        guard let searchText = searchText else { return }
        showSpinner()
        presenter?.fetchProductList(searchTerm: searchText)
    }
}

extension ProductListViewController: SpinnerDisplayable {}
extension ProductListViewController: MessageDisplayable {}
extension ProductListViewController: ProductListViewDelegate {}

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

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 5
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductListViewCell.self.reuseIdentifier,
                for: indexPath) as? ProductListViewCell
        else {
            return UICollectionViewCell()
        }
        let dataItem = ProductListViewModel(id: "11111", name: "Tenis Nike Big Nike Low color negro - adulto 12 US", imageURL: URL(string: "https://http2.mlstatic.com/D_NQ_NP_955830-MLA82798500814_032025-F.jpg"))
        cell.configData(itemData: dataItem)
        return cell
    }
}

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
    }
}
