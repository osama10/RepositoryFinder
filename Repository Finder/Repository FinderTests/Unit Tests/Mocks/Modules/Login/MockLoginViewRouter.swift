//
//  MockLoginViewRouter.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder


class MockLoginViewRouter : LoginViewPresenterToRouterDelegate{
    var viewType : RepoListType
    var owner : Owner
    init(viewType : RepoListType, owner : Owner) {
        self.viewType = viewType
        self.owner = owner
    }
    func showRepoListView(with viewType: RepoListType, owner: Owner?) {
        self.viewType = viewType
        self.owner = owner!
    }
    
    
}
