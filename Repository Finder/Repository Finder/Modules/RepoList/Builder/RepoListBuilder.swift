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
    func build(with viewType : RepoListType)->UIViewController
}

class RepoListBuilderImp : RepoListBuilder{
   
    var interactor : ( RepoListPresenterToInteractorDelegate & RepoListInteractor )!
    var presenter : (RepoListPresenter & RepoLisViewToPresenterDelegate & RepoListInteractorToPresenterDelegate)!
    var view : (RepoListPresenterToViewDelegate & RepoListViewController )!
    var router : (RepoListPresenterToRouterDelagate)!
    
    func build(with viewType : RepoListType)->UIViewController{
       
        registrInteractor()
        registerView()
        registerPresenter(with: viewType)
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
        let repoViewController = RepoListRouterImp.instantiateViewController() as! RepoListViewController
        self.view = repoViewController
        
    }
    
    private func registerPresenter(with viewType : RepoListType){
         self.presenter = RepoListPresenterImp(view: view, viewType: .search)

    }
    private func registerRouter(repoViewController : UIViewController){
        self.router = RepoListRouterImp(repoListViewController: repoViewController)
    }
    
}
