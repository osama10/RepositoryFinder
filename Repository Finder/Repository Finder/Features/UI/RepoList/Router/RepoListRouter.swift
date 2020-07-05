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
    func createView() -> UIViewController
}

class RepoListRouterImp : RepoListRouter{
    var navigationController: UINavigationController!

    func createView() -> UIViewController {
        let repoListBuilder : RepoListBuilder = RepoListBuilderImp()
        let repoListViewController = repoListBuilder.build(with: .search, owner: .none)
        navigationController = UINavigationController(rootViewController: repoListViewController)
        navigationController.makeDefaultSettings()
        return navigationController
    }
}

extension RepoListRouterImp : RepoListPresenterToRouterDelagate{
    func pushToForkScreen(repository: String, userName: String, totalForks: Int){
        let forkListBuilder : ForksListBuilder = ForksListBuilderImp()
        let forkListVC = forkListBuilder.build(repository: repository, userName: userName, totalForks: totalForks)
        navigationController.pushViewController(forkListVC, animated: true)
    }
    
    func dismissForkList() {
        navigationController.popViewController(animated: true)
    }
}
