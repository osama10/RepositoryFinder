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
    func showRepoListScreen()->UINavigationController
}

class RepoListRouterImp : RepoListRouter{
    
    weak var presenter: RepoListRouterToPresenterDelegate!
    var navigationController: UINavigationController!
    
    func showRepoListScreen() -> UINavigationController {
        let repoListBuilder : RepoListBuilder = RepoListBuilderImp()
        let repoListVC = repoListBuilder.build(with: .search, router: self)
        self.navigationController = UINavigationController(rootViewController: repoListVC)
        self.navigationController.makeDefaultSettings()
        return self.navigationController
    }
    
}

extension RepoListRouterImp : RepoListPresenterToRouterDelagate{
    func pushToForkScreen(repository: String, userName: String, totalForks: Int){
        let forkListBuilder : ForksListBuilder = ForksListBuilderImp()
        let forkListVC = forkListBuilder.build(repository: repository, userName: userName, totalForks: totalForks)
        
        self.navigationController.pushViewController(forkListVC, animated: true)
    }
}


extension RepoListRouterImp : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}

