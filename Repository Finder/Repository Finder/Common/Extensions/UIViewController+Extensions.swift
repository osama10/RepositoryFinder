//
//  UIViewController+Extensions.swift
//  Repository Finder
//
//  Created by Osama Bashir on 7/4/20.
//  Copyright © 2020 Osama Bin Bashir. All rights reserved.
//

import UIKit

protocol AlertsPresentable : class {}
extension AlertsPresentable where Self : UIViewController {

    func showAlert(with title: String? = nil , and message: String? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)

    }

}

extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
