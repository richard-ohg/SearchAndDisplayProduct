//
//  ProductDetailViewController.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//  
//

import UIKit

class ProductDetailViewController: UIViewController {

    var presenter: ProductDetail_ViewToPresenterProtocol?
    var productId: String?

    lazy var productDetailView: ProductDetailView = {
        let view = ProductDetailView()
        return view
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = productDetailView
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension ProductDetailViewController: ProductDetail_PresenterToViewProtocol {
}

