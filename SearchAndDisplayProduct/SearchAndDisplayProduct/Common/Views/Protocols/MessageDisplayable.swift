//
//  MessageDisplayable.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit

protocol MessageDisplayable { }

extension MessageDisplayable where Self: UIViewController {
    
    func presentSimpleAlert(
        title: String? = AppLocalized.defaultAlertTitle,
        message: String?,
        actionTitle: String = AppLocalized.defaultOkButton,
        actionHandler: ((UIAlertAction) -> Void)? = nil)
    {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: actionTitle, style: .default)
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    
    func presentDoubleAlert(
        title: String? = AppLocalized.defaultAlertTitle,
        message: String?,
        firstActionTitle: String = AppLocalized.defaultCancelButton,
        firstActionHandler: ((UIAlertAction) -> Void)? = nil,
        secondActionTitle: String = AppLocalized.defaultOkButton,
        secondActionHandler: ((UIAlertAction) -> Void)? = nil)
    {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: firstActionTitle, style: .cancel, handler: firstActionHandler)
        let okAction = UIAlertAction(title: secondActionTitle, style: .cancel, handler: secondActionHandler)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    
    func presentCustomAlert(
        title: String? = nil,
        message: String? = nil,
        customActions: [UIAlertAction],
        style: UIAlertController.Style = .alert)
    {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style)
        
        customActions.forEach(alertController.addAction(_:))
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}
