//
//  ProducDetailView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

protocol ProductDetailViewDelegate: AnyObject {}

final class ProductDetailView: UIView {
    
    weak var delegate: ProductDetailViewDelegate?
    
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
        
    }
    
    private func addConstraints() {
        
    }
}

extension ProductDetailView: BackgroundGradientProtocol {}
