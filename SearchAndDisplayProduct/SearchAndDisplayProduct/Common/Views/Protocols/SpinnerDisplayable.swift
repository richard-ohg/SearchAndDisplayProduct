//
//  SpinnerDisplayable.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
    func showSpinner()
    func hideSpinner()
}

extension SpinnerDisplayable where Self : UIViewController {
    private var doesNotExistAnotherSpinner: Bool {
        parentView.viewWithTag(123) == nil
    }
    
    private var parentView: UIView {
        navigationController?.view ?? view
    }
    
    func showSpinner() {
        guard doesNotExistAnotherSpinner else { return }
        configureSpinner()
    }
    
    func hideSpinner(){
        if let foundView = self.parentView.viewWithTag(123) {
            foundView.removeFromSuperview()
        }
    }
    
    private func configureSpinner() {
        let containerView = UIView()
        containerView.tag = 123
        parentView.addSubview(containerView)
        containerView.pinEdges(to: parentView)
        containerView.backgroundColor = .black.withAlphaComponent(0.3)
        addSpinnerIndicatorToContainer(containerView: containerView)
    }
    
    private func addSpinnerIndicatorToContainer(containerView: UIView) {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        containerView.addSubview(spinner)
        spinner.pinCenter(to: containerView)
    }
}
