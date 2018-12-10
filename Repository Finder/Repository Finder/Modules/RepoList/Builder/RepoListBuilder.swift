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
    func build(with viewType : RepoListType, owner : Owner?)->UIViewController
}

class RepoListBuilderImp : RepoListBuilder{
   
    var interactor : ( RepoListPresenterToInteractorDelegate & RepoListInteractor )!
    var presenter : (RepoListPresenter & RepoLisViewToPresenterDelegate & RepoListInteractorToPresenterDelegate)!
    var view : (RepoListPresenterToViewDelegate & RepoListViewController )!
    var router : (RepoListPresenterToRouterDelagate)!
    
    func build(with viewType : RepoListType, owner : Owner?)->UIViewController{
       
        registrInteractor()
        registerView()
        registerPresenter(with: viewType, owner: owner)
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
    
    private func registerPresenter(with viewType : RepoListType, owner : Owner?){
        self.presenter = RepoListPresenterImp(view: view, viewType: viewType, owner : owner)

    }
    private func registerRouter(repoViewController : UIViewController){
        self.router = RepoListRouterImp(repoListViewController: repoViewController)
    }
    
}
