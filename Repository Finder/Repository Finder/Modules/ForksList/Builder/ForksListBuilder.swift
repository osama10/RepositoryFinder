//
//  ForksListBuilder.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol ForksListBuilder {
     func build(repository: String, userName: String, totalForks: Int)->UIViewController
}

class ForksListBuilderImp : ForksListBuilder{
    var interactor : ( ForkListPresenterToInteractorDelegate & ForkListInteractor )!
    var presenter : (ForkListPresenter & ForkListViewToPresenterDelegate & ForkListInteractorToPresenterDelegate)!
    var view : (ForkListPresenterToViewDelegate & ForkListViewController )!
    var router : (ForkListPresenterToRouterDelagate)!
    
    func build(repository: String, userName: String, totalForks: Int)->UIViewController{
        
        registrInteractor()
        registerView()
        registerPresenter(repository: repository, userName: userName, totalForks: totalForks)
        registerRouter()
        
        self.view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return self.view
    }
    
    private func registrInteractor(){
        let services = ForkListServicesImp(networkManager: AlamofireManager.shared)
        self.interactor = ForkListInteractorImp(forkListServices: services)
    }
    
    private func registerView(){
        let storyboard = UIStoryboard(storyboard: .main)
        let repoViewController: ForkListViewController = storyboard.instantiateViewController()
        view = repoViewController
        
    }
    
    private func registerPresenter(repository: String, userName: String, totalForks: Int){
        self.presenter = ForkListPresenterImp(view: self.view, userName: userName, repoName: repository, totalForks: totalForks)
        
    }
    private func registerRouter(){
        self.router  = ForkListRouterImp()
    }
}
