//
//  LoginViewController.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class LoginViewController: UIViewController, AlertsPresentable,NVActivityIndicatorViewable {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var searchRepositoriesButton: UIButton!
    
     var presenter : LoginViewViewToPresenterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    @IBAction func didTapOnLoginButton(_ sender: UIButton) {
        guard let userName = self.userNameTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        self.presenter.didTapOnLogin(userName: userName, password: password)
}
    
    @IBAction func didTapOnSearchRepositoriesButton(_ sender: UIButton) {
        self.presenter.didTapOnSearchRepositories()
    }
    
    
}

extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

extension LoginViewController : LoginViewPresenterToViewDelegate{
    func startAnimatingLoader() {
        self.startAnimating()
    }
    
    func stopAnimatingLoader() {
        self.stopAnimating()
    }
    
    func showErrorAlert(with title: String, message: String) {
        self.showAlert(with: title, and: message)
    }
    
    func emptyTextFields() {
        self.userNameTextField.text = ""
        self.passwordTextField.text = ""
    }
    
}
