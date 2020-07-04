//
//  LoginViewRouter.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewRouter {
    var navigationController : UINavigationController!{ get }
    var loginViewController : UIViewController!{ get }
    func createView()->UIViewController
}

class LoginViewRouterImp : LoginViewRouter{
    var navigationController: UINavigationController!
    var loginViewController: UIViewController!
    
    func createView() -> UIViewController {
        let loginViewBuilder : LoginViewBuilder = LoginViewBuilderImp()
        self.loginViewController = loginViewBuilder.build(router: self)
        return self.loginViewController
    }
    
}

extension LoginViewRouterImp : LoginViewPresenterToRouterDelegate{
   
    func showRepoListView(with viewType: RepoListType, owner : Owner?) {
        let repoListBuilder : RepoListBuilder = RepoListBuilderImp()
        let repoListVC = repoListBuilder.build(with: viewType, owner: owner)
        self.navigationController = UINavigationController(rootViewController: repoListVC)
        self.navigationController.makeDefaultSettings()
        self.loginViewController.present(self.navigationController, animated: true, completion: nil)
    }
}
