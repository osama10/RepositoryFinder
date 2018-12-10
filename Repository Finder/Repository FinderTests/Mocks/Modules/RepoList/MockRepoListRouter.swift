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
    var dismissForkListCalled = false
    
    func pushToForkScreen(repository: String, userName: String, totalForks: Int) {
        self.pushToForkScreenCalled = true
    }
    
    func dismissForkList() {
        self.dismissForkListCalled = true
    }
    
    
}
