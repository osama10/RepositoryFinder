//
//  MockRepoListPresenter.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder


class MockRepoListInteractor : RepoListPresenterToInteractorDelegate{
    var userName = ""
    var page = 1
    var perPageNumber = 23
    var totalRepo = 70
    var queryString = ""
    
    func fetchUserRepositories(userName: String, page: Int, perPageNumber: Int, totalRepo: Int) {
        self.userName = userName
        self.page = page
        self.perPageNumber = perPageNumber
        self.totalRepo = totalRepo
    }
    
    func fetchSearchRepositories(queryString: String, page: Int, perPageNumber: Int) {
        self.queryString = queryString
        self.page = page
        self.perPageNumber = perPageNumber
    }
    
    
}
