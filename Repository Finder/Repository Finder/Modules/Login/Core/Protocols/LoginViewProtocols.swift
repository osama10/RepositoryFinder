//
//  LoginViewProtocols.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol LoginViewViewToPresenterDelegate : class{
    func didTapOnLogin(userName : String, password : String)
    func didTapOnSearchRepositories()
}

protocol LoginViewPresenterToViewDelegate : class{
    func startAnimatingLoader()
    func stopAnimatingLoader()
    func showErrorAlert(with title : String, message : String)
    func emptyTextFields()
}

protocol LoginViewPresenterToRouterDelegate : class{
    func showRepoListView(with viewType: RepoListType, owner : Owner?)
}

protocol LoginViewPresenterToInteractorDelegate : class {
    func makeAuthentication(userName : String, password : String)
}

protocol LoginViewInteractotToPresenterDelegate : class {
    func didAuthenticated(loginDTO : LoginDTO)
}
