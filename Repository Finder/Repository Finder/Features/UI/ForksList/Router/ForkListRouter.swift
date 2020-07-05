//
//  ForkListRouter.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol ForkListRouter {

}

class ForkListRouterImp : ForkListRouter {
    var forkViewController: UIViewController

    init(forkViewController: UIViewController) {
        self.forkViewController = forkViewController
    }
}

extension ForkListRouterImp : ForkListPresenterToRouterDelagate{
    func pushToRouterScreen(owner: Owner) {
        let repoViewController = RepoListBuilderImp().build(viewType: .user, owner: owner)
        forkViewController.navigationController?.pushViewController(repoViewController, animated: true)
    }

}


