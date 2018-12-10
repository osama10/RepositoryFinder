//
//  RepoListRouter.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol RepoListRouter  {
    var presenter : RepoListRouterToPresenterDelegate! { get set}
    var navigationController : UINavigationController! { get }
    func createRepoListScreen()->UINavigationController
}

class RepoListRouterImp : RepoListRouter{
    
    weak var presenter: RepoListRouterToPresenterDelegate!
    var navigationController: UINavigationController!
    
    func createRepoListScreen() -> UINavigationController {
        let repoViewController = RepoListRouterImp.instantiateViewController() as! RepoListViewController

        let services = RepoListServicesImp(networkManager: AlamofireManager.shared)
        var interactor : RepoListPresenterToInteractorDelegate & RepoListInteractor = RepoListInteractorImp(repoListServices: services)
        let presenter = RepoListPresenterImp(view: repoViewController, viewType: .search)
        
        repoViewController.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = self
        
        self.navigationController = UINavigationController(rootViewController: repoViewController)
        self.navigationController.makeDefaultSettings()
        return self.navigationController
    }
       
    
   
}

extension RepoListRouterImp : RepoListPresenterToRouterDelagate{
    func pushToForkScreen(repository: String, userName: String, totalForks: Int){
        
        let viewController =  ForkListRouterImp.instantiateViewController() as! ForkListViewController
        
        let services = ForkListServicesImp(networkManager: AlamofireManager.shared)
     
        var interactor : ForkListPresenterToInteractorDelegate & ForkListInteractor = ForkListInteractorImp(forkListServices: services)
        let presenter = ForkListPresenterImp(view: viewController, userName: userName, repoName: repository, totalForks: totalForks)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        //presenter.router = self as! ForkListPresenterToRouterDelagate
        interactor.presenter = presenter
        
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}


extension RepoListRouterImp : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}

