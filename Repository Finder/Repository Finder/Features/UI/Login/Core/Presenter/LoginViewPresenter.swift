//
//  LoginViewPresenter.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol LoginViewPresenter : class {
    var view : LoginViewPresenterToViewDelegate!{ get set }
    var router : LoginViewPresenterToRouterDelegate!{ get set}
    var interactor : LoginViewPresenterToInteractorDelegate!{ get set }
}


class LoginViewPresenterImp : LoginViewPresenter{
    
    weak var view: LoginViewPresenterToViewDelegate!
    var router: LoginViewPresenterToRouterDelegate!
    var interactor : LoginViewPresenterToInteractorDelegate!
    
}

extension LoginViewPresenterImp : LoginViewViewToPresenterDelegate{
    func didTapOnLogin(userName: String, password: String) {
        logInTapHandler(userName: userName, password: password)
    }
    
    private func  logInTapHandler(userName: String, password: String){
        if(!(userName.isBlank() || password.isBlank())){
            self.interactor.makeAuthentication(userName: userName, password: password)
            self.view.startAnimatingLoader()
        }else{
            self.view.showErrorAlert(with: "Error", message: pleaseFillAllTheFields)
        }
    }
    
    func didTapOnSearchRepositories() {
        self.router.showRepoListView(with: .search, owner: nil)
    }
}

extension LoginViewPresenterImp : LoginViewInteractotToPresenterDelegate{

    func didAuthenticated(loginDTO: LoginDTO) {
        self.didAuthenticatedHandler(loginDTO: loginDTO)
    }
    
    private func didAuthenticatedHandler(loginDTO: LoginDTO){
        self.view.stopAnimatingLoader()

        if(loginDTO.isError){
            self.view.showErrorAlert(with: "", message: loginDTO.errorMessage)
        }else{
            self.router.showRepoListView(with:.user, owner: loginDTO.owners)
            self.view.emptyTextFields()
        }
    }
}



