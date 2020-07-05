//
//  AppStartup.swift
//  Repository Finder
//
//  Created by Osama Bashir on 7/5/20.
//  Copyright © 2020 Osama Bin Bashir. All rights reserved.
//

import UIKit

final class AppStartup {
    static var navigationController: UINavigationController!

    class func start() -> UIViewController {
        let builder: RepoListBuilder = RepoListBuilderImp()
        let rootViewController = builder.build(with: .search, owner: .none)
        AppStartup.navigationController = UINavigationController(rootViewController: rootViewController)
        AppStartup
            .navigationController.makeDefaultSettings()
        return navigationController
    }

}
