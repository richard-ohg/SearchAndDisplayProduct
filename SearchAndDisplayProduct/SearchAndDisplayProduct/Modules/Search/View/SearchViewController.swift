//
//  SearchViewController.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 13/04/25.
//  
//

import UIKit

class SearchViewController: UIViewController {

    var presenter: Search_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.getColorWith(hex: "#0db2b5").cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension SearchViewController: Search_PresenterToViewProtocol {
}
