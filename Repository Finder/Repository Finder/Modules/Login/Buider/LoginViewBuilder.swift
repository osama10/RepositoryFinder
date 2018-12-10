//
//  LoginViewBuilder.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewBuilder {
    func build(router : LoginViewPresenterToRouterDelegate)->UIViewController
}

class LoginViewBuilderImp : LoginViewBuilder{
   
    var presenter : (LoginViewPresenter & LoginViewViewToPresenterDelegate & LoginViewInteractotToPresenterDelegate)!
    var view : (LoginViewController & LoginViewPresenterToViewDelegate)!
    var router : (LoginViewPresenterToRouterDelegate)!
    var interactor : (LoginViewInteractor & LoginViewPresenterToInteractorDelegate)!
    
    func build(router : LoginViewPresenterToRouterDelegate)->UIViewController{
        registerView()
        registerInteractor()
        registerRouter(router: router)
        registerPresenter()
        
        presenter.view = view
        view.presenter = presenter
        presenter.router = self.router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    private func registerView(){
        self.view = LoginViewRouterImp.instantiateViewController() as! LoginViewController
    }
    
    private func registerPresenter(){
        self.presenter = LoginViewPresenterImp()
    }
   
    private func registerRouter(router : LoginViewPresenterToRouterDelegate){
        self.router = router
    }
    
    private func registerInteractor(){
        let loginService = LoginServiceImp(networkManager: AlamofireManager.shared)
        self.interactor = LoginViewInteractorImp(loginService: loginService)
    }
    
    
    
}
