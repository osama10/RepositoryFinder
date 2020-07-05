//
//  MockRepoListRouter.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockRepoListRouter : RepoListPresenterToRouterDelagate{
    var pushToForkScreenCalled = false

    func pushToForkScreen(repository: String, owner: Owner, totalForks: Int) {
        self.pushToForkScreenCalled = true

    }

}
