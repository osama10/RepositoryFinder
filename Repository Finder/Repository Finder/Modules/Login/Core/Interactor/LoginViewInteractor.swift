//
//  LoginViewInteractor.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol LoginViewInteractor {
    var presenter : LoginViewInteractotToPresenterDelegate! { get set}
    var loginService : LoginServices{ get }
    func authenticateUser(userName : String , password : String)
}

class LoginViewInteractorImp : LoginViewInteractor{
    weak var presenter: LoginViewInteractotToPresenterDelegate!
    var loginService: LoginServices
    
    init(loginService : LoginServices) {
        self.loginService = loginService
    }
    
    func authenticateUser(userName: String, password: String) {
        self.loginService.authenticateUser(userName: userName, password: password) { [weak self](result) in
            guard let `self` = self else { return }
            let loginDTO = self.preapreDataFromLogintRequest(result: result)
            self.presenter.didAuthenticated(loginDTO: loginDTO)
        }
    }
    
    private func preapreDataFromLogintRequest(result : ServicesResult<Owner>)->LoginDTO{
        var loginDTO : LoginDTO!
        switch result {
        case .success(let data):
            loginDTO = LoginDTO(owners: data, isError: false, errorMessage: "")
        case .error(let errorMessage):
            loginDTO = LoginDTO(owners: nil, isError: true, errorMessage: errorMessage)

        }
        return loginDTO
    }
}

extension LoginViewInteractorImp : LoginViewPresenterToInteractorDelegate{
    func makeAuthentication(userName: String, password: String) {
        self.authenticateUser(userName: userName, password: password)
    }
    
    
    
}





