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
}


class LoginViewPresenterImp : LoginViewPresenter{
    
    weak var view: LoginViewPresenterToViewDelegate!
    var router: LoginViewPresenterToRouterDelegate!
    
}

extension LoginViewPresenterImp : LoginViewViewToPresenterDelegate{
    func didTapOnLogin(userName: String, password: String) {
            //call
    }
    
    func didTapOnSearchRepositories() {
        self.router.showRepoListView(with: .search)
    }
}



