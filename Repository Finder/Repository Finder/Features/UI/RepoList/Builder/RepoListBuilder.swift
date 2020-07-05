//
//  RepoListBuilder.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol RepoListBuilder {
    func build() -> UIViewController
}

class RepoListBuilderImp : RepoListBuilder{
   
    var interactor : ( RepoListPresenterToInteractorDelegate & RepoListInteractor )!
    var presenter : (RepoListPresenter & RepoLisViewToPresenterDelegate & RepoListInteractorToPresenterDelegate)!
    var view : (RepoListPresenterToViewDelegate & RepoListViewController )!
    var router : (RepoListPresenterToRouterDelagate)!
    
    func build() -> UIViewController{
       
        registrInteractor()
        registerView()
        registerPresenter()
        registerRouter(repoViewController: self.view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = self.router
        
        return view
    }
    
    private func registrInteractor(){
        let services = RepoListServicesImp(networkManager: AlamofireManager.shared)
        self.interactor = RepoListInteractorImp(repoListServices: services)
    }
    
    private func registerView(){
        let repoViewController: RepoListViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        self.view = repoViewController
        
    }
    
    private func registerPresenter(){
        self.presenter = RepoListPresenterImp(view: view)

    }
    private func registerRouter(repoViewController : UIViewController){
        router = RepoListRouterImp(repoListViewController: repoViewController)
    }
    
}
