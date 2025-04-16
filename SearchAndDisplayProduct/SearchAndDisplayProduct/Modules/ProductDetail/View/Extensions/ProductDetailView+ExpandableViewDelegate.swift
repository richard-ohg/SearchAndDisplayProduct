//
//  ProductDetailView+ExpandableViewDelegate.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

extension ProductDetailView: ExpandableViewDelegate {
    func tapped(isOpen: Bool, view: ExpandableView) {
        guard let tag = TagIdentifier(rawValue: view.tag) else { return }
        switch tag {
        case .description:
            specsContainer.isOpen = !isOpen
        case .specs:
            descriptionContainer.isOpen = !isOpen
        }
    }
}
