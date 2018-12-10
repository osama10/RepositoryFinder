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
    var repoListViewController : UIViewController!{ get }
}

class RepoListRouterImp : RepoListRouter{
    
    var repoListViewController: UIViewController!
    init(repoListViewController : UIViewController) {
        self.repoListViewController = repoListViewController
    }
    
   
    
}

extension RepoListRouterImp : RepoListPresenterToRouterDelagate{
    func pushToForkScreen(repository: String, userName: String, totalForks: Int){
        let forkListBuilder : ForksListBuilder = ForksListBuilderImp()
        let forkListVC = forkListBuilder.build(repository: repository, userName: userName, totalForks: totalForks)
        self.repoListViewController.navigationController?.pushViewController(forkListVC, animated: true)
    }
    
    func dismissForkList() {
        self.repoListViewController.dismiss(animated: true, completion: nil)
    }
}


extension RepoListRouterImp : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}

