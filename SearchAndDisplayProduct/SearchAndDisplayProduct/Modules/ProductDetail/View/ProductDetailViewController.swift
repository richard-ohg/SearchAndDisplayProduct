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

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension ProductDetailViewController: ProductDetail_PresenterToViewProtocol {
}
